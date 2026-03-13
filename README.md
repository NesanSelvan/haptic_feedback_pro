# haptic_feedback_pro ⚡

A Flutter plugin for triggering rich haptic feedback on iOS and Android.

Supports all native haptic types — impact, notification, selection, and full vibration. 🎯

---

## 📱 Platform Support

| Android | iOS |
|:-------:|:---:|
| ✅      | ✅  |

---

## 🚀 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  haptic_feedback_pro: ^1.0.0
```

Then run:

```bash
flutter pub get
```

---

## 🛠️ Usage

```dart
import 'package:haptic_feedback_pro/haptic_feedback_pro.dart';

// Trigger any feedback type
await HapticFeedbackPro.trigger(FeedbackType.success);
await HapticFeedbackPro.trigger(FeedbackType.heavy);
await HapticFeedbackPro.trigger(FeedbackType.vibration);
```

---

## 🎛️ Feedback Types

| Type | Description |
|------|-------------|
| `FeedbackType.light` | 🪶 Light impact |
| `FeedbackType.medium` | 👆 Medium impact |
| `FeedbackType.heavy` | 💪 Heavy impact |
| `FeedbackType.soft` | 🫧 Soft impact |
| `FeedbackType.rigid` | 🪨 Rigid impact |
| `FeedbackType.success` | ✅ Success notification |
| `FeedbackType.warning` | ⚠️ Warning notification |
| `FeedbackType.error` | ❌ Error notification |
| `FeedbackType.selection` | 🔘 Selection change |
| `FeedbackType.vibration` | 📳 Full device vibration |

---

## ⚙️ Requirements

- 🍎 **iOS:** 10.0+
- 🤖 **Android:** API 16+ (haptic effects require API 26+)
- 💙 **Flutter:** 3.0+

---

## 🌟 Built By

Enjoyed this package? Check out the app we built it for 🚀

<p align="center">
  <a href="https://nutriscan.app/">
    <img src="https://raw.githubusercontent.com/NesanSelvan/haptic_feedback_pro/main/screenshots/download-banner.png" alt="Download NutriScan" width="100%" height="150">
  </a>
</p>

---

## 📄 License

MIT
