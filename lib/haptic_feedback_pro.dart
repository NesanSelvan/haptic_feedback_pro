import 'haptic_feedback_pro_platform_interface.dart';

enum FeedbackType { light, medium, heavy, soft, rigid, success, warning, error, selection, vibration }

class HapticFeedbackPro {
  const HapticFeedbackPro._();

  static Future<void> trigger(FeedbackType feedbackType) {
    return HapticFeedbackProPlatform.instance.trigger(feedbackType.name);
  }
}
