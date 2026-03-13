import 'package:flutter_test/flutter_test.dart';
import 'package:haptic_feedback_pro/haptic_feedback_pro.dart';
import 'package:haptic_feedback_pro/haptic_feedback_pro_platform_interface.dart';
import 'package:haptic_feedback_pro/haptic_feedback_pro_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHapticFeedbackProPlatform
    with MockPlatformInterfaceMixin
    implements HapticFeedbackProPlatform {
  String? lastTriggered;

  @override
  Future<void> trigger(String feedbackType) async {
    lastTriggered = feedbackType;
  }
}

void main() {
  final HapticFeedbackProPlatform initialPlatform =
      HapticFeedbackProPlatform.instance;

  test('MethodChannelHapticFeedbackPro is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelHapticFeedbackPro>());
  });

  group('HapticFeedbackPro.trigger', () {
    late MockHapticFeedbackProPlatform mock;

    setUp(() {
      mock = MockHapticFeedbackProPlatform();
      HapticFeedbackProPlatform.instance = mock;
    });

    for (final type in FeedbackType.values) {
      test('triggers ${type.name}', () async {
        await HapticFeedbackPro.trigger(type);
        expect(mock.lastTriggered, type.name);
      });
    }
  });
}
