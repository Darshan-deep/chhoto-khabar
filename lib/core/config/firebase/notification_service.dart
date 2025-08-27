import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:path_provider/path_provider.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final selectNotificationStream = BehaviorSubject<String?>();

  bool _isInitialized = false;
  bool _isBackgroundMode = false;

  final _androidChannel = const AndroidNotificationChannel(
    'default_channel',
    'General Notifications',
    description: 'This channel is used for general notifications',
    importance: Importance.high,
    showBadge: true,
    playSound: true,
    enableVibration: true,
  );

  // Initialize for foreground mode (full initialization)
  Future<void> init({bool isBackground = false}) async {
    if (_isInitialized && !isBackground) {
      log('📱 Notification service already initialized, skipping...');
      return;
    }

    _isBackgroundMode = isBackground;
    
    try {
      if (!isBackground) {
        // Only request permissions and setup listeners in foreground mode
        await _requestPermissions();
        await _setupNotificationListeners();
      }
      
      // Create notification channel (works in both modes)
      await _createNotificationChannel();

      // Initialize the plugin with basic settings
      final initialized = await _flutterLocalNotificationsPlugin.initialize(
        _initializationSettings(),
        onDidReceiveNotificationResponse: isBackground ? null : _selectNotification,
      );
      
      if (initialized == true) {
        _isInitialized = true;
        log('✅ Notification service initialized successfully (background: $isBackground)');
      } else {
        log('❌ Failed to initialize notification service');
      }
    } catch (e) {
      log('❌ Error initializing notification service: $e');
      // In background mode, don't throw - just log and continue
      if (!isBackground) {
        rethrow;
      }
    }
  }

  // Method to copy asset image to a temporary location
  Future<String?> _copyAssetToTemp(String assetPath) async {
    try {
      final byteData = await rootBundle.load(assetPath);
      final tempDir = await getTemporaryDirectory();
      final fileName = assetPath.split('/').last;
      final file = File('${tempDir.path}/$fileName');
      
      await file.writeAsBytes(byteData.buffer.asUint8List());
      log('📁 Asset copied to temp: ${file.path}');
      return file.path;
    } catch (e) {
      log('❌ Error copying asset to temp: $e');
      return null;
    }
  }

  // Method to get FilePathAndroidBitmap from asset
  Future<FilePathAndroidBitmap?> _getImageFromAsset(String assetPath) async {
    final tempPath = await _copyAssetToTemp(assetPath);
    if (tempPath != null) {
      return FilePathAndroidBitmap(tempPath);
    }
    return null;
  }

  // Enhanced method to show notification with image
  Future<void> showNotificationWithImage({
    required String title,
    required String body,
    required String payload,
    String? imagePath, // Asset path like 'assets/notification_images/baby.png'
    String? largeIconPath, // Asset path for large icon
  }) async {
    if (!_isInitialized) {
      log('❌ Notification service not initialized, cannot show notification');
      return;
    }

    try {
      // Prepare image attachments
      FilePathAndroidBitmap? largeIcon;
      FilePathAndroidBitmap? bigPicture;

      if (largeIconPath != null) {
        largeIcon = await _getImageFromAsset(largeIconPath);
      }

      if (imagePath != null) {
        bigPicture = await _getImageFromAsset(imagePath);
      }

      // Android notification details with image support
      AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
        _androidChannel.id,
        _androidChannel.name,
        channelDescription: _androidChannel.description,
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
        icon: '@mipmap/ic_launcher',
        enableVibration: true,
        ticker: title,
        largeIcon: largeIcon,
        styleInformation: bigPicture != null 
            ? BigPictureStyleInformation(
                bigPicture,
                contentTitle: title,
                summaryText: body,
                largeIcon: largeIcon,
              )
            : BigTextStyleInformation(
                body,
                contentTitle: title,
              ),
      );

      // iOS notification details with image support
      DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
        presentSound: true,
        presentBadge: true,
        presentAlert: true,
        attachments: imagePath != null 
            ? [DarwinNotificationAttachment(await _copyAssetToTemp(imagePath) ?? '')]
            : null,
      );

      final NotificationDetails notificationDetails = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );

      final notificationId = DateTime.now().millisecondsSinceEpoch.remainder(100000);
      
      await _flutterLocalNotificationsPlugin.show(
        notificationId,
        title,
        body,
        notificationDetails,
        payload: payload,
      );
      
      log('📨 Notification with image shown: $title (ID: $notificationId)');
    } catch (e) {
      log('❌ Error showing notification with image: $e');
    }
  }

  // Enhanced background notification with image support
  Future<void> showBackgroundNotificationWithImage({
    required String title,
    required String body,
    Map<String, dynamic>? data,
    String? imagePath,
    String? largeIconPath,
  }) async {
    try {
      final payload = data != null ? jsonEncode(data) : '';
      
      // Prepare image attachments
      FilePathAndroidBitmap? largeIcon;
      FilePathAndroidBitmap? bigPicture;

      if (largeIconPath != null) {
        largeIcon = await _getImageFromAsset(largeIconPath);
      }

      if (imagePath != null) {
        bigPicture = await _getImageFromAsset(imagePath);
      }

      AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
        _androidChannel.id,
        _androidChannel.name,
        channelDescription: _androidChannel.description,
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
        enableVibration: true,
        ticker: title,
        largeIcon: largeIcon,
        styleInformation: bigPicture != null 
            ? BigPictureStyleInformation(
                bigPicture,
                contentTitle: title,
                summaryText: body,
                largeIcon: largeIcon,
              )
            : null,
      );

      DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
        presentSound: true,
        presentBadge: true,
        presentAlert: true,
        attachments: imagePath != null 
            ? [DarwinNotificationAttachment(await _copyAssetToTemp(imagePath) ?? '')]
            : null,
      );

      final NotificationDetails notificationDetails = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );

      final notificationId = DateTime.now().millisecondsSinceEpoch.remainder(100000);
      
      await _flutterLocalNotificationsPlugin.show(
        notificationId,
        title,
        body,
        notificationDetails,
        payload: payload,
      );
      
      log('📨 Background notification with image shown: $title (ID: $notificationId)');
    } catch (e) {
      log('❌ Error showing background notification with image: $e');
    }
  }

  // Your existing methods remain the same...
  Future<void> initForBackground() async {
    try {
      log('🔄 Initializing notification service for background mode...');
      
      // Only create channel and basic initialization
      await _createNotificationChannel();
      
      // Minimal initialization without permission requests
      await _flutterLocalNotificationsPlugin.initialize(
        _initializationSettings(),
        onDidReceiveNotificationResponse: null, // No callback in background
      );
      
      _isInitialized = true;
      _isBackgroundMode = true;
      log('✅ Background notification service initialized');
    } catch (e) {
      log('❌ Error initializing background notification service: $e');
    }
  }

  Future<void> _requestPermissions() async {
    try {
      // Request permissions for local notifications
      final androidImplementation = _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      
      if (androidImplementation != null) {
        final granted = await androidImplementation.requestNotificationsPermission();
        log('📱 Android notification permission granted: $granted');
      }

      // For iOS
      final iosImplementation = _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>();
      
      if (iosImplementation != null) {
        final granted = await iosImplementation.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
        log('📱 iOS notification permission granted: $granted');
      }
    } catch (e) {
      log('❌ Error requesting permissions: $e');
      rethrow;
    }
  }

  Future<void> _setupNotificationListeners() async {
    try {
      // Check if app was launched from notification
      final details = await _flutterLocalNotificationsPlugin
          .getNotificationAppLaunchDetails();
      if (details != null && details.didNotificationLaunchApp) {
        String? payload = details.notificationResponse?.payload;
        if (payload?.isNotEmpty ?? false) {
          log('🚀 App launched from notification with payload: $payload');
          selectNotificationStream.add(payload);
        }
      }
    } catch (e) {
      log('❌ Error setting up notification listeners: $e');
    }
  }

  Future<void> _createNotificationChannel() async {
    try {
      final androidImplementation = _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      
      if (androidImplementation != null) {
        await androidImplementation.createNotificationChannel(_androidChannel);
        log('📱 Notification channel created successfully');
      }
    } catch (e) {
      log('❌ Error creating notification channel: $e');
    }
  }

  InitializationSettings _initializationSettings() {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    return const InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );
  }

  void _selectNotification(NotificationResponse response) {
    log("📣 Notification tapped - actionId: ${response.actionId}, payload: ${response.payload}");
    
    if (response.payload != null && response.payload!.isNotEmpty) {
      try {
        selectNotificationStream.add(response.payload);
        final data = jsonDecode(response.payload!);
        log("📋 Parsed notification payload: $data");
        
        // Handle notification tap navigation
        _handleNotificationTap(data);
      } catch (e) {
        log("❌ Error parsing notification payload: $e");
        selectNotificationStream.add(response.payload);
      }
    } else {
      log("⚠️ No payload found in notification response");
      selectNotificationStream.add(null);
    }
  }

  void _handleNotificationTap(Map<String, dynamic> data) {
    try {
      // Handle navigation based on notificationType first (primary routing)
      if (data.containsKey('notificationType')) {
        final notificationType = data['notificationType'];
        log('📋 Handling notification tap for type: $notificationType');
        
        String? routeName = _getRouteForNotificationType(notificationType);
        if (routeName != null) {
          log('🔀 Navigating to route: $routeName for type: $notificationType');
          
          // Add navigation parameters based on notification type
          Map<String, dynamic> navParams = _buildNavigationParams(notificationType, data);
          
          // Trigger navigation (this will be handled by NotificationHandlerWidget)
          selectNotificationStream.add(jsonEncode({
            'route': routeName,
            'params': navParams,
            'notificationType': notificationType,
          }));
        } else {
          log('⚠️ Unknown notification type: $notificationType');
        }
      }
      
      // Handle legacy screen-based navigation (fallback)
      else if (data.containsKey('screen')) {
        final screen = data['screen'];
        log('🔀 Navigating to screen: $screen');
        
        switch (screen) {
          case 'home':
            selectNotificationStream.add(jsonEncode({'route': '/home'}));
            break;
          case 'profile':
            final userId = data['user_id'] ?? '';
            selectNotificationStream.add(jsonEncode({
              'route': '/profile',
              'params': {'userId': userId}
            }));
            break;
          case 'messages':
            if (data.containsKey('message_id')) {
              final messageId = data['message_id'];
              log('📨 Opening message: $messageId');
              selectNotificationStream.add(jsonEncode({
                'route': '/messages',
                'params': {'messageId': messageId}
              }));
            }
            break;
          default:
            log('⚠️ Unknown screen: $screen');
            selectNotificationStream.add(jsonEncode({'route': '/home'}));
        }
      }
      
      // Handle user-specific actions
      if (data.containsKey('user_id')) {
        final userId = data['user_id'];
        log('👤 Notification for user: $userId');
      }
      
    } catch (e) {
      log('❌ Error handling notification tap: $e');
    }
  }

  // Map notification types to their corresponding routes
  String? _getRouteForNotificationType(String notificationType) {
    switch (notificationType.toLowerCase()) {
      case 'assignment':
        return '/assignment';
      case 'announcement':
        return '/student-notifications';
      case 'grade':
        return '/assignment';
      case 'attendance':
        return '/student-attendance';
      case 'event':
        return '/student-calendar';
      case 'holiday':
        return '/student-calendar';
      case 'fee':
        return '/student-fee';
      case 'exam':
        return '/student-academic-record';
      case 'result':
        return '/student-academic-record';
      default:
        return null;
    }
  }

  // Build navigation parameters based on notification type and data
  Map<String, dynamic> _buildNavigationParams(String notificationType, Map<String, dynamic> data) {
    Map<String, dynamic> params = {};
    
    switch (notificationType.toLowerCase()) {
      case 'assignment':
        if (data.containsKey('assignment_id')) {
          params['assignmentId'] = data['assignment_id'];
        }
        if (data.containsKey('subject_id')) {
          params['subjectId'] = data['subject_id'];
        }
        break;
        
      case 'announcement':
        if (data.containsKey('announcement_id')) {
          params['announcementId'] = data['announcement_id'];
        }
        break;
        
      case 'grade':
        if (data.containsKey('assignment_id')) {
          params['assignmentId'] = data['assignment_id'];
        }
        if (data.containsKey('subject_id')) {
          params['subjectId'] = data['subject_id'];
        }
        break;
        
      case 'attendance':
        if (data.containsKey('date')) {
          params['date'] = data['date'];
        }
        if (data.containsKey('class_id')) {
          params['classId'] = data['class_id'];
        }
        break;
        
      case 'event':
      case 'holiday':
        if (data.containsKey('event_id')) {
          params['eventId'] = data['event_id'];
        }
        if (data.containsKey('date')) {
          params['date'] = data['date'];
        }
        break;
        
      case 'fee':
        if (data.containsKey('fee_id')) {
          params['feeId'] = data['fee_id'];
        }
        if (data.containsKey('due_date')) {
          params['dueDate'] = data['due_date'];
        }
        break;
        
      case 'exam':
      case 'result':
        if (data.containsKey('exam_id')) {
          params['examId'] = data['exam_id'];
        }
        if (data.containsKey('result_id')) {
          params['resultId'] = data['result_id'];
        }
        if (data.containsKey('subject_id')) {
          params['subjectId'] = data['subject_id'];
        }
        break;
    }
    
    // Add common parameters
    if (data.containsKey('user_id')) {
      params['userId'] = data['user_id'];
    }
    
    return params;
  }

  // Original showNormalNotification method (kept for backward compatibility)
  Future<void> showNormalNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    await showNotificationWithImage(
      title: title,
      body: body,
      payload: payload,
    );
  }

  // Simplified method for background notifications (kept for backward compatibility)
  Future<void> showBackgroundNotification({
    required String title,
    required String body,
    Map<String, dynamic>? data,
  }) async {
    await showBackgroundNotificationWithImage(
      title: title,
      body: body,
      data: data,
    );
  }

  // Test notification with your baby image
  Future<void> showTestNotificationWithImage() async {
    await showNotificationWithImage(
      title: 'Test Notification with Image',
      body: 'This is a test notification with a custom baby image!',
      imagePath: 'assets/notification_images/baby.png',
      largeIconPath: 'assets/notification_images/baby.png',
      payload: jsonEncode({
        'test': true,
        'screen': 'home',
        'timestamp': DateTime.now().toIso8601String(),
        'hasImage': true,
      }),
    );
    log('🧪 Test notification with image sent');
  }

  Future<void> showTestNotification() async {
    await showNormalNotification(
      title: 'Test Notification',
      body: 'This is a test to verify local notifications are working properly',
      payload: jsonEncode({
        'test': true,
        'screen': 'home',
        'timestamp': DateTime.now().toIso8601String()
      }),
    );
    log('🧪 Test notification sent');
  }

  void dispose() {
    selectNotificationStream.close();
  }
}