import 'package:chhoto_khabar/shared/user/global_naviagtion_services.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:chhoto_khabar/core/config/firebase/notification_service.dart';
// Import your global navigation service
// import 'global_navigation_service.dart';

class NotificationHandlerWidget extends StatefulWidget {
  final Widget child;

  const NotificationHandlerWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<NotificationHandlerWidget> createState() =>
      _NotificationHandlerWidgetState();
}

class _NotificationHandlerWidgetState extends State<NotificationHandlerWidget> {
  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    _setupNotificationListener();
    
    // Mark app as ready after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Give a small delay to ensure router is fully initialized
      Future.delayed(const Duration(milliseconds: 100), () {
        GlobalNavigationService.instance.markAppReady();
      });
    });
  }

  void _setupNotificationListener() {
    // Listen to notification taps
    _notificationService.selectNotificationStream.listen((String? payload) {
      if (payload != null && payload.isNotEmpty) {
        _handleNotificationTap(payload);
      }
    });
  }

  void _handleNotificationTap(String payload) {
    try {
      final data = jsonDecode(payload);
      log('🔔 Handling notification tap: $data');

      // Handle new route-based navigation
      if (data.containsKey('route')) {
        final route = data['route'];
        final params = data.containsKey('params') ? data['params'] : {};
        
        log('🔀 Navigating to route: $route with params: $params');
        GlobalNavigationService.instance.navigateTo(route, params: params);
      }
      // Handle legacy navigation based on payload
      else if (data.containsKey('screen')) {
        final screen = data['screen'];
        _navigateToScreen(screen, data);
      }
      // Handle notification type directly
      else if (data.containsKey('notificationType')) {
        final notificationType = data['notificationType'];
        log('🔔 Handling notification type: $notificationType');
        
        GlobalNavigationService.instance.navigateForNotificationType(
          notificationType, 
          data: data
        );
      }
    } catch (e) {
      log('❌ Error handling notification tap: $e');
    }
  }

  void _navigateToScreen(String screen, Map<String, dynamic> data) {
    // Legacy screen navigation using the global service
    switch (screen) {
      case 'home':
        GlobalNavigationService.instance.navigateTo('/');
        break;
      case 'profile':
        final userId = data['user_id'] ?? '';
        GlobalNavigationService.instance.navigateTo(
          '/student-personal-info', 
          params: {'userId': userId}
        );
        break;
      case 'chat':
        final chatId = data['chat_id'] ?? '';
        GlobalNavigationService.instance.navigateTo(
          '/chat', 
          params: {'chatId': chatId}
        );
        break;
      case 'messages':
        final messageId = data['message_id'] ?? '';
        GlobalNavigationService.instance.navigateTo(
          '/student-notifications', 
          params: {'messageId': messageId}
        );
        break;
      case 'announcement':
        final announcementId = data['announcement_id'] ?? '';
        GlobalNavigationService.instance.navigateTo(
          '/student-notifications',
          params: {'announcementId': announcementId}
        );
        break;
      default:
        log('⚠️ Unknown screen: $screen');
        GlobalNavigationService.instance.navigateTo('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Additional check to mark app as ready when we have router context
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!GlobalNavigationService.instance.isAppReady) {
        final router = GoRouter.maybeOf(context);
        if (router != null) {
          GlobalNavigationService.instance.markAppReady();
        }
      }
    });
    
    return widget.child;
  }

  @override
  void dispose() {
    // Clean up any pending navigation
    GlobalNavigationService.instance.clearPendingNavigation();
    super.dispose();
  }
}