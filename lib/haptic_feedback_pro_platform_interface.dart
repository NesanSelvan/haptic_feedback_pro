import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'haptic_feedback_pro_method_channel.dart';

abstract class HapticFeedbackProPlatform extends PlatformInterface {
  HapticFeedbackProPlatform() : super(token: _token);

  static final Object _token = Object();

  static HapticFeedbackProPlatform _instance = MethodChannelHapticFeedbackPro();

  static HapticFeedbackProPlatform get instance => _instance;
  static set instance(HapticFeedbackProPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> trigger(String feedbackType) {
    return _instance.trigger(feedbackType);
  }
}
