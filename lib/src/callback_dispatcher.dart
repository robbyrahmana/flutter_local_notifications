part of flutter_local_notifications;

callbackDispatcher() {
  print('Dart: callbackDispatcher invoked');
  const MethodChannel _backgroundChannel =
      MethodChannel('dexterous.com/flutter/local_notifications_background');
  WidgetsFlutterBinding.ensureInitialized();

  _backgroundChannel.setMethodCallHandler((MethodCall call) async {
    print('received method call');
    final args = call.arguments;
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
  });
  print('notification dispatcher started');
  _backgroundChannel.invokeMethod('NotificationService.initialized');
}
