## 1.0.3

* Improved Android haptic reliability — wrapped trigger in try/catch with proper error reporting via `result.error`
* Added `VibrationAttributes` with `USAGE_TOUCH` for Android 13+ (API 33+) for better haptic classification
* Used `VibratorManager.defaultVibrator` correctly on Android 12+ (API 31+) instead of calling vibrate directly on the manager

## 1.0.2

* Updated README section

## 1.0.1

* Fixed Android haptic not working — added missing `VIBRATE` permission to `AndroidManifest.xml`
* Fixed `createPredefined()` crash on Android API 26–28 — added fallback `createOneShot` effects

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
