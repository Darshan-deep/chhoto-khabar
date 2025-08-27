// ==========================================
// Updated firebase_api_config.dart with Image Support
// ==========================================
import 'dart:convert';
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:chhoto_khabar/core/config/firebase/notification_service.dart';
import 'package:chhoto_khabar/shared/data/local/fcm_token_service.dart';

@pragma('vm:entry-point')
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  try {
    log('📦 Background message received: ${message.messageId}');
    log('📋 Background message title: ${message.notification?.title}');
    log('📋 Background message body: ${message.notification?.body}');
    log('📋 Background message data: ${message.data}');

    // Initialize Firebase if not already done
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp();
    }

    // Initialize notification service for background mode
    final notificationService = NotificationService();
    await notificationService.initForBackground();

    // Show a background notification with image support
    final title = message.notification?.title ?? 'New Notification';
    final body = message.notification?.body ?? 'You have a new message';

    // Determine image paths based on notification data
    String? imagePath;
    String? largeIconPath;

    // Check if server provides image paths
    if (message.data.containsKey('image_path')) {
      imagePath = message.data['image_path'];
      log('📸 Server provided image path: $imagePath');
    }

    if (message.data.containsKey('large_icon_path')) {
      largeIconPath = message.data['large_icon_path'];
      log('📸 Server provided large icon path: $largeIconPath');
    }

    // If no server images, determine based on notification type
    if (imagePath == null && message.data.containsKey('notificationType')) {
      final type = message.data['notificationType'];
      imagePath = _getImageForNotificationType(type);
      largeIconPath = imagePath; // Use same image for both
      log('📸 Auto-selected image for type "$type": $imagePath');
    }

    // Fallback to default baby image
    if (imagePath == null) {
      imagePath = 'assets/notification_images/baby.png';
      largeIconPath = imagePath;
      log('📸 Using default baby image: $imagePath');
    }

    // Show background notification with image
    await notificationService.showBackgroundNotificationWithImage(
      title: title,
      body: body,
      imagePath: imagePath,
      largeIconPath: largeIconPath,
      data: message.data,
    );

    log('📨 Background notification with image shown successfully');

    // Handle background data processing
    await _processBackgroundData(message);

    log('✅ Background message with image handled successfully: ${message.messageId}');
  } catch (e, stackTrace) {
    log('❌ Error handling background message: $e');
    log('📋 Stack trace: $stackTrace');
    // Don't rethrow in background handler
  }
}

// Helper function to get image based on notification type
String? _getImageForNotificationType(String notificationType) {
  switch (notificationType.toLowerCase()) {
    case 'assignment':
      log('📝 Selected assignment image');
      return 'assets/notification_images/baby.png';
    case 'announcement':
      log('📢 Selected announcement image');
      return 'assets/notification_images/baby.png';
    case 'grade':
      log('📊 Selected grade image');
      return 'assets/notification_images/baby.png';
    case 'attendance':
      log('📅 Selected attendance image');
      return 'assets/notification_images/baby.png';
    case 'event':
      log('🎉 Selected event image');
      return 'assets/notification_images/baby.png';
    case 'holiday':
      log('🏖️ Selected holiday image');
      return 'assets/notification_images/baby.png';
    case 'fee':
      log('💰 Selected fee image');
      return 'assets/notification_images/fee.png';
    case 'exam':
      log('📝 Selected exam image');
      return 'assets/notification_images/baby.png';
    case 'result':
      log('🎯 Selected result image');
      return 'assets/notification_images/baby.png';
    case 'baby':
      log('👶 Selected baby image');
      return 'assets/notification_images/baby.png';
    default:
      log('❓ Unknown notification type "$notificationType", using baby image as default');
      return 'assets/notification_images/baby.png';
  }
}

// Process background data (enhanced with image logging)
Future<void> _processBackgroundData(RemoteMessage message) async {
  try {
    log('🔄 Processing background data...');

    // Example: Update badge count
    if (message.data.containsKey('badge_count')) {
      final badgeCount =
          int.tryParse(message.data['badge_count'].toString()) ?? 0;
      log('📱 Updating badge count to: $badgeCount');
    }

    // Example: Handle urgent notifications
    if (message.data.containsKey('priority') &&
        message.data['priority'] == 'high') {
      log('⚡ High priority message processing');
    }

    // Store notification data for when app opens
    if (message.data.containsKey('notificationType')) {
      final notificationType = message.data['notificationType'];
      log('📝 Storing notification type: $notificationType');
      // Store in local storage for later processing
    }

    // Log image-related data
    if (message.data.containsKey('image_path')) {
      log('📸 Image path stored: ${message.data['image_path']}');
    }

    if (message.data.containsKey('large_icon_path')) {
      log('📸 Large icon path stored: ${message.data['large_icon_path']}');
    }

    log('✅ Background data processing completed');
  } catch (e) {
    log('❌ Error processing background data: $e');
  }
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final FCMTokenService fcmTokenService = FCMTokenService();
  final NotificationService _notificationService = NotificationService();

  Future<void> handleMessage(RemoteMessage? message) async {
    if (message == null) {
      log('⚠️ Received null message, skipping...');
      return;
    }

    log('📨 Handling message: ${message.messageId}');
    log('📋 Message title: ${message.notification?.title}');
    log('📋 Message body: ${message.notification?.body}');
    log('📋 Message data: ${message.data}');

    // Log image-related data if present
    if (message.data.containsKey('image_path')) {
      log('📸 Message contains image path: ${message.data['image_path']}');
    }

    if (message.data.containsKey('large_icon_path')) {
      log('📸 Message contains large icon path: ${message.data['large_icon_path']}');
    }

    // Handle navigation based on message data
    await _handleMessageNavigation(message);
  }

  Future<void> _handleMessageNavigation(RemoteMessage message) async {
    try {
      log('🔄 Processing message navigation...');
      final data = message.data;

      // Handle navigation based on notificationType first (primary routing)
      if (data.containsKey('notificationType')) {
        final notificationType = data['notificationType'];
        log('📋 Handling notification type: $notificationType');

        String? routeName = _getRouteForNotificationType(notificationType);
        if (routeName != null) {
          log('🔀 Navigating to route: $routeName for type: $notificationType');

          // Store navigation data for when app opens
          _storeNavigationData(routeName, data);

          // Handle specific notification type logic
          await _handleNotificationTypeLogic(notificationType, data);
        } else {
          log('⚠️ Unknown notification type: $notificationType');
        }
      }

      // Handle legacy screen-based navigation (fallback)
      else if (data.containsKey('screen')) {
        final screen = data['screen'];
        log('🔀 Navigating to screen: $screen');

        // Handle specific screens with parameters
        switch (screen) {
          case 'chat':
            if (data.containsKey('chat_id')) {
              final chatId = data['chat_id'];
              log('💬 Opening chat: $chatId');
            }
            break;
          case 'profile':
            if (data.containsKey('user_id')) {
              final userId = data['user_id'];
              log('👤 Opening profile: $userId');
            }
            break;
          case 'home':
            log('🏠 Navigating to home screen');
            break;
          default:
            log('⚠️ Unknown screen: $screen');
        }

        _storeNavigationData(screen, data);
      }

      log('✅ Message navigation processing completed');
    } catch (e) {
      log('❌ Error handling message navigation: $e');
    }
  }

  // Map notification types to their corresponding routes
  String? _getRouteForNotificationType(String notificationType) {
    switch (notificationType.toLowerCase()) {
      case 'assignment':
        log('📝 Mapped assignment to /assignment route');
        return '/assignment';
      case 'announcement':
        log('📢 Mapped announcement to /student-notifications route');
        return '/student-notifications';
      case 'grade':
        log('📊 Mapped grade to /assignment route');
        return '/assignment';
      case 'attendance':
        log('📅 Mapped attendance to /student-attendance route');
        return '/student-attendance';
      case 'event':
        log('🎉 Mapped event to /student-calendar route');
        return '/student-calendar';
      case 'holiday':
        log('🏖️ Mapped holiday to /student-calendar route');
        return '/student-calendar';
      case 'fee':
        log('💰 Mapped fee to /student-fee route');
        return '/student-fee';
      case 'exam':
        log('📝 Mapped exam to /student-academic-record route');
        return '/student-academic-record';
      case 'result':
        log('🎯 Mapped result to /student-academic-record route');
        return '/student-academic-record';
      default:
        log('❓ No route mapping found for notification type: $notificationType');
        return null;
    }
  }

  // Handle specific logic for each notification type (enhanced with image logging)
  Future<void> _handleNotificationTypeLogic(
      String notificationType, Map<String, dynamic> data) async {
    try {
      log('🔄 Processing notification type logic for: $notificationType');

      switch (notificationType.toLowerCase()) {
        case 'assignment':
          log('📝 Processing assignment notification');
          if (data.containsKey('assignment_id')) {
            final assignmentId = data['assignment_id'];
            log('📝 Assignment ID: $assignmentId');
          }
          if (data.containsKey('subject_id')) {
            final subjectId = data['subject_id'];
            log('📝 Subject ID: $subjectId');
          }
          break;

        case 'announcement':
          log('📢 Processing announcement notification');
          if (data.containsKey('announcement_id')) {
            final announcementId = data['announcement_id'];
            log('📢 Announcement ID: $announcementId');
          }
          break;

        case 'grade':
          log('📊 Processing grade notification');
          if (data.containsKey('subject_id')) {
            final subjectId = data['subject_id'];
            log('📊 Subject ID: $subjectId');
          }
          if (data.containsKey('assignment_id')) {
            final assignmentId = data['assignment_id'];
            log('📊 Assignment ID: $assignmentId');
          }
          break;

        case 'attendance':
          log('📅 Processing attendance notification');
          if (data.containsKey('date')) {
            final date = data['date'];
            log('📅 Attendance date: $date');
          }
          if (data.containsKey('class_id')) {
            final classId = data['class_id'];
            log('📅 Class ID: $classId');
          }
          break;

        case 'event':
          log('🎉 Processing event notification');
          if (data.containsKey('event_id')) {
            final eventId = data['event_id'];
            log('🎉 Event ID: $eventId');
          }
          if (data.containsKey('date')) {
            final date = data['date'];
            log('🎉 Event date: $date');
          }
          break;

        case 'holiday':
          log('🏖️ Processing holiday notification');
          if (data.containsKey('holiday_id')) {
            final holidayId = data['holiday_id'];
            log('🏖️ Holiday ID: $holidayId');
          }
          if (data.containsKey('date')) {
            final date = data['date'];
            log('🏖️ Holiday date: $date');
          }
          break;

        case 'fee':
          log('💰 Processing fee notification');
          if (data.containsKey('fee_id')) {
            final feeId = data['fee_id'];
            log('💰 Fee ID: $feeId');
          }
          if (data.containsKey('due_date')) {
            final dueDate = data['due_date'];
            log('💰 Fee due date: $dueDate');
          }
          break;

        case 'exam':
          log('📝 Processing exam notification');
          if (data.containsKey('exam_id')) {
            final examId = data['exam_id'];
            log('📝 Exam ID: $examId');
          }
          if (data.containsKey('subject_id')) {
            final subjectId = data['subject_id'];
            log('📝 Exam subject ID: $subjectId');
          }
          break;

        case 'result':
          log('🎯 Processing result notification');
          if (data.containsKey('result_id')) {
            final resultId = data['result_id'];
            log('🎯 Result ID: $resultId');
          }
          if (data.containsKey('exam_id')) {
            final examId = data['exam_id'];
            log('🎯 Result exam ID: $examId');
          }
          break;

        default:
          log('❓ Unknown notification type: $notificationType');
      }

      // Log image information if present
      if (data.containsKey('image_path')) {
        log('📸 Notification contains image: ${data['image_path']}');
      }

      log('✅ Notification type logic processing completed for: $notificationType');
    } catch (e) {
      log('❌ Error handling notification type logic: $e');
    }
  }

  // Store navigation data for when app becomes active (enhanced with image logging)
  void _storeNavigationData(String route, Map<String, dynamic> data) {
    try {
      log('💾 Storing navigation data for route: $route');

      // You can store this in shared preferences or a service for later use
      final navigationData = {
        'route': route,
        'data': data,
        'timestamp': DateTime.now().toIso8601String(),
      };

      log('💾 Navigation data to store: $navigationData');

      // Log image data if present
      if (data.containsKey('image_path')) {
        log('📸 Navigation includes image: ${data['image_path']}');
      }

      // Example: Store in a service or shared preferences
      // NavigationService.storePendingNavigation(navigationData);

      log('✅ Navigation data stored successfully');
    } catch (e) {
      log('❌ Error storing navigation data: $e');
    }
  }

  Future<void> initNotifications() async {
    try {
      log('🔄 Initializing Firebase notifications...');

      // Initialize the unified notification service for foreground mode
      await _notificationService.init(isBackground: false);
      log('✅ Notification service initialized');

      // Request FCM permissions
      log('📱 Requesting FCM permissions...');
      final NotificationSettings settings =
          await _firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
        announcement: false,
        carPlay: false,
        criticalAlert: false,
      );

      log('📱 FCM Permission status: ${settings.authorizationStatus}');

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        log('✅ User granted FCM notification permission');
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        log('⚠️ User granted provisional FCM notification permission');
      } else {
        log('❌ User declined FCM notification permission');
        return;
      }

      // Handle FCM token
      await _handleFCMToken();

      // Initialize push notification handlers
      await initPushNotifications();

      log('✅ Firebase notifications with image support initialized successfully');
    } catch (e, stackTrace) {
      log('❌ Error initializing Firebase notifications: $e');
      log('📋 Stack trace: $stackTrace');
    }
  }

  Future<void> _handleFCMToken() async {
    try {
      log('🔄 Handling FCM token...');

      String? fcmToken = await fcmTokenService.getFCMToken();
      if (fcmToken == null) {
        log('🔄 FCM Token not found. Requesting new token...');
        fcmToken = await _firebaseMessaging.getToken();
        if (fcmToken != null) {
          log('📱 New FCM Token generated: $fcmToken'); // Log full token
          await fcmTokenService.writeFCMToken(fcmToken);
          log('✅ FCM Token saved successfully');
        } else {
          log('❌ FCM Token not generated!');
          return;
        }
      } else {
        log('📱 Existing FCM Token found: $fcmToken'); // Log full token
      }

      // Listen for token refresh
      _firebaseMessaging.onTokenRefresh.listen((fcmToken) {
        log('🔄 FCM Token refresh detected');
        fcmTokenService.writeFCMToken(fcmToken);
        log('🔄 FCM Token refreshed: $fcmToken'); // Log full token
        _sendTokenToServer(fcmToken);
      });

      log('✅ FCM token handling completed');
    } catch (e) {
      log('❌ Error handling FCM token: $e');
    }
  }

  Future<void> _sendTokenToServer(String token) async {
    try {
      log('📤 Sending FCM token to server...');
      log('📤 Token to send: ${token.substring(0, 20)}...');
      
      // Add your server API call here
      // await ApiService.sendFCMToken(token);
      
      log('✅ FCM token sent to server successfully');
    } catch (e) {
      log('❌ Failed to send FCM token to server: $e');
    }
  }

  Future<void> initPushNotifications() async {
    try {
      log('🔄 Initializing push notification handlers...');

      // Set foreground notification presentation options
      await _firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
      log('✅ Foreground notification presentation options set');

      // Handle app launch from terminated state
      FirebaseMessaging.instance.getInitialMessage().then((message) {
        if (message != null) {
          log('🚀 App opened from terminated state via notification');
          log('📋 Initial message ID: ${message.messageId}');
          log('📋 Initial message data: ${message.data}');
          
          if (message.data.containsKey('image_path')) {
            log('📸 Initial message contains image: ${message.data['image_path']}');
          }
          
          handleMessage(message);
        } else {
          log('📱 App opened normally (not from notification)');
        }
      });

      // Handle app opened from background state
      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        log('📱 App opened from background state via notification');
        log('📋 Background opened message ID: ${message.messageId}');
        log('📋 Background opened message data: ${message.data}');
        
        if (message.data.containsKey('image_path')) {
          log('📸 Background message contains image: ${message.data['image_path']}');
        }
        
        handleMessage(message);
      });

      // Handle foreground messages with enhanced image support
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        log('📨 Foreground message received: ${message.messageId}');
        log('📋 Foreground message title: ${message.notification?.title}');
        log('📋 Foreground message body: ${message.notification?.body}');
        log('📋 Foreground message data: ${message.data}');

        final notification = message.notification;
        if (notification != null) {
          String notificationTitle = notification.title ?? 'New Notification';
          String notificationBody = notification.body ?? '';

          log('📬 Preparing to show foreground notification: $notificationTitle');

          // Determine image paths
          String? imagePath;
          String? largeIconPath;

          // Check if server provides image paths
          if (message.data.containsKey('image_path')) {
            imagePath = message.data['image_path'];
            log('📸 Server provided image path: $imagePath');
          }

          if (message.data.containsKey('large_icon_path')) {
            largeIconPath = message.data['large_icon_path'];
            log('📸 Server provided large icon path: $largeIconPath');
          }

          // If no server images, determine based on notification type
          if (imagePath == null && message.data.containsKey('notificationType')) {
            final type = message.data['notificationType'];
            imagePath = _getImageForNotificationType(type);
            largeIconPath = imagePath; // Use same image for both
            log('📸 Auto-selected image for type "$type": $imagePath');
          }

          // Fallback to default baby image
          if (imagePath == null) {
            imagePath = 'assets/notification_images/baby.png';
            largeIconPath = imagePath;
            log('📸 Using default baby image: $imagePath');
          }

          // Show foreground notification with image
          _notificationService.showNotificationWithImage(
            title: notificationTitle,
            body: notificationBody,
            imagePath: imagePath,
            largeIconPath: largeIconPath,
            payload: jsonEncode(message.data),
          );

          log('📬 Foreground notification with image displayed: $notificationTitle');
        } else {
          log('⚠️ Foreground message has no notification payload');
        }
      });

      log('✅ Push notification handlers with image support initialized');
    } catch (e) {
      log('❌ Error initializing push notifications: $e');
    }
  }

  // Topic subscription methods (enhanced with logging)
  Future<void> subscribeToTopic(String topic) async {
    try {
      log('🔄 Subscribing to topic: $topic');
      await _firebaseMessaging.subscribeToTopic(topic);
      log('✅ Successfully subscribed to topic: $topic');
    } catch (e) {
      log('❌ Error subscribing to topic $topic: $e');
    }
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      log('🔄 Unsubscribing from topic: $topic');
      await _firebaseMessaging.unsubscribeFromTopic(topic);
      log('✅ Successfully unsubscribed from topic: $topic');
    } catch (e) {
      log('❌ Error unsubscribing from topic $topic: $e');
    }
  }

  Future<String?> refreshToken() async {
    try {
      log('🔄 Refreshing FCM token...');
      final fcmToken = await _firebaseMessaging.getToken();
      if (fcmToken != null) {
        await fcmTokenService.writeFCMToken(fcmToken);
        await _sendTokenToServer(fcmToken);
        log('🔄 FCM Token refreshed: ${fcmToken.substring(0, 20)}...');
        return fcmToken;
      }
      log('❌ Failed to refresh FCM token');
      return null;
    } catch (e) {
      log('❌ Error refreshing FCM token: $e');
      return null;
    }
  }

  // Enhanced test notification methods
  Future<void> sendTestNotification() async {
    log('🧪 Sending basic test notification...');
    await _notificationService.showTestNotification();
    log('✅ Basic test notification sent');
  }

  Future<void> sendTestNotificationWithImage() async {
    log('🧪 Sending test notification with baby image...');
    await _notificationService.showTestNotificationWithImage();
    log('✅ Test notification with image sent');
  }

  // Method to test different notification types with images
  Future<void> testNotificationTypes() async {
    log('🧪 Testing different notification types with images...');

    final notificationTypes = [
      'assignment',
      'announcement',
      'grade',
      'attendance',
      'event',
      'holiday',
      'fee',
      'exam',
      'result',
      'baby'
    ];

    for (final type in notificationTypes) {
      final imagePath = _getImageForNotificationType(type);
      
      await _notificationService.showNotificationWithImage(
        title: 'Test ${type.toUpperCase()} Notification',
        body: 'This is a test notification for $type with image',
        imagePath: imagePath,
        largeIconPath: imagePath,
        payload: jsonEncode({
          'test': true,
          'notificationType': type,
          'timestamp': DateTime.now().toIso8601String(),
        }),
      );

      log('🧪 Test notification sent for type: $type with image: $imagePath');
      
      // Small delay between notifications
      await Future.delayed(const Duration(seconds: 2));
    }

    log('✅ All notification type tests completed');
  }
}