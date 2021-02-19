/// Plugin initialization settings for Android.
class AndroidInitializationSettings {
  /// Constructs an instance of [AndroidInitializationSettings].
  const AndroidInitializationSettings(
    this.defaultIcon, {
    this.callbackDispatcher,
    this.showNotificationCallback,
  });

  /// Specifies the default icon for notifications.
  final String defaultIcon;

  /// callbackDispatcher
  final int callbackDispatcher;

  /// showNotificationCallback
  final int showNotificationCallback;
}
