import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Handle callback
void callbackDispatcher() {
  debugPrint('Dart: callbackDispatcher invoked');
  const MethodChannel _backgroundChannel =
      MethodChannel('dexterous.com/flutter/local_notifications_background');
  WidgetsFlutterBinding.ensureInitialized();

  _backgroundChannel.setMethodCallHandler((MethodCall call) async {
    debugPrint('Dart: received method call');
    final dynamic args = call.arguments;
    /*switch (call.method) {
      case 'onShowNotification':
        var callbackHandle = args['callbackHandle'];
        var notificationId = args['notification_id'];
        var notificationTitle = args['notification_title'];
        var notificationBody = args['notification_body'];
        var notificationPayload = args['notification_payload'];
        final Function callback = PluginUtilities.getCallbackFromHandle(
            CallbackHandle.fromRawHandle(callbackHandle));
        assert(callback != null);
        callback(notificationId, notificationTitle, notificationBody,
            notificationPayload);
        break;
    }*/
    final dynamic callbackHandle = args['callbackHandle'];
    final dynamic notificationId = args['notification_id'];
    final dynamic notificationTitle = args['notification_title'];
    final dynamic notificationBody = args['notification_body'];
    final dynamic notificationPayload = args['notification_payload'];
    final Function callback = PluginUtilities.getCallbackFromHandle(
        CallbackHandle.fromRawHandle(callbackHandle));
    assert(callback != null);
    callback(notificationId, notificationTitle, notificationBody,
        notificationPayload);
  });
  debugPrint('Dart: notification dispatcher started');
  _backgroundChannel.invokeMethod('NotificationService.initialized');
}
