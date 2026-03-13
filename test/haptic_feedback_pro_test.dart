import 'package:flutter_test/flutter_test.dart';
import 'package:haptic_feedback_pro/haptic_feedback_pro.dart';
import 'package:haptic_feedback_pro/haptic_feedback_pro_platform_interface.dart';
import 'package:haptic_feedback_pro/haptic_feedback_pro_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHapticFeedbackProPlatform
    with MockPlatformInterfaceMixin
    implements HapticFeedbackProPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final HapticFeedbackProPlatform initialPlatform = HapticFeedbackProPlatform.instance;

  test('$MethodChannelHapticFeedbackPro is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelHapticFeedbackPro>());
  });

  test('getPlatformVersion', () async {
    HapticFeedbackPro hapticFeedbackProPlugin = HapticFeedbackPro();
    MockHapticFeedbackProPlatform fakePlatform = MockHapticFeedbackProPlatform();
    HapticFeedbackProPlatform.instance = fakePlatform;

    expect(await hapticFeedbackProPlugin.getPlatformVersion(), '42');
  });
}
