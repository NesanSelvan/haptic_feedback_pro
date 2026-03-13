import 'package:flutter/material.dart';
import 'package:haptic_feedback_pro/haptic_feedback_pro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HapticExamplePage());
  }
}

class HapticExamplePage extends StatelessWidget {
  const HapticExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    final haptic = HapticFeedbackPro();

    return Scaffold(
      appBar: AppBar(title: const Text('Haptic Feedback Pro')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SectionLabel('Notification'),
          _HapticTile('Success', FeedbackType.success, Colors.green, haptic),
          _HapticTile('Warning', FeedbackType.warning, Colors.orange, haptic),
          _HapticTile('Error', FeedbackType.error, Colors.red, haptic),
          const SizedBox(height: 16),
          _SectionLabel('Impact'),
          _HapticTile(
            'Light',
            FeedbackType.light,
            Colors.blue.shade200,
            haptic,
          ),
          _HapticTile(
            'Medium',
            FeedbackType.medium,
            Colors.blue.shade400,
            haptic,
          ),
          _HapticTile(
            'Heavy',
            FeedbackType.heavy,
            Colors.blue.shade700,
            haptic,
          ),
          _HapticTile(
            'Soft',
            FeedbackType.soft,
            Colors.purple.shade200,
            haptic,
          ),
          _HapticTile(
            'Rigid',
            FeedbackType.rigid,
            Colors.purple.shade700,
            haptic,
          ),
          const SizedBox(height: 16),
          _SectionLabel('Selection'),
          _HapticTile('Selection', FeedbackType.selection, Colors.teal, haptic),
          const SizedBox(height: 16),
          _SectionLabel('Vibration'),
          _HapticTile('Vibration', FeedbackType.vibration, Colors.grey.shade700, haptic),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel(this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(label, style: Theme.of(context).textTheme.titleSmall),
    );
  }
}

class _HapticTile extends StatelessWidget {
  final String label;
  final FeedbackType type;
  final Color color;
  final HapticFeedbackPro haptic;

  const _HapticTile(this.label, this.type, this.color, this.haptic);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(52),
        ),
        onPressed: () => haptic.trigger(type),
        child: Text(label),
      ),
    );
  }
}
