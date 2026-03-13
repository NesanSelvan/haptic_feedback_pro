import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'haptic_feedback_pro_platform_interface.dart';

class MethodChannelHapticFeedbackPro extends HapticFeedbackProPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('haptic_feedback_pro');

  @override
  Future<void> trigger(String feedbackType) async {
    await methodChannel.invokeMethod<void>('trigger', feedbackType);
  }
}
