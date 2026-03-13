## 1.0.0

* Initial release of `haptic_feedback_pro`
* Added `HapticFeedbackPro.trigger()` as a static method
* Added 10 haptic feedback types via `FeedbackType` enum:
  * `light`, `medium`, `heavy`, `soft`, `rigid` — impact feedback
  * `success`, `warning`, `error` — notification feedback
  * `selection` — selection feedback
  * `vibration` — full device vibration
* iOS support using `UIImpactFeedbackGenerator`, `UINotificationFeedbackGenerator`, `UISelectionFeedbackGenerator`, and `AudioServicesPlaySystemSound`
* Android support using `VibrationEffect` with API 29+ predefined effects and fallbacks for API 26–28
