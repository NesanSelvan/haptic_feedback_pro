import Flutter
import UIKit
import AudioToolbox

public class HapticFeedbackProPlugin: NSObject, FlutterPlugin {
  private lazy var lightImpactGenerator = UIImpactFeedbackGenerator(style: .light)
    private lazy var mediumImpactGenerator = UIImpactFeedbackGenerator(style: .medium)
    private lazy var heavyImpactGenerator = UIImpactFeedbackGenerator(style: .heavy)
    private lazy var notificationGenerator = UINotificationFeedbackGenerator()
    private lazy var softImpactGenerator: UIImpactFeedbackGenerator? = {
        if #available(iOS 13.0, *) {
            return UIImpactFeedbackGenerator(style: .soft)
        }
        return nil
    }()
    private lazy var rigidImpactGenerator: UIImpactFeedbackGenerator? = {
        if #available(iOS 13.0, *) {
            return UIImpactFeedbackGenerator(style: .rigid)
        }
        return nil
    }()
    private lazy var selectionGenerator = UISelectionFeedbackGenerator()
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "haptic_feedback_pro", binaryMessenger: registrar.messenger())
    let instance = HapticFeedbackProPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
      case "trigger":
        trigger(call.arguments as! String)
        result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  public func trigger(_ feedbackType : String){
switch feedbackType {
case "light": lightImpactGenerator.prepare(); lightImpactGenerator.impactOccurred()
case "medium": mediumImpactGenerator.prepare(); mediumImpactGenerator.impactOccurred()
case "heavy": heavyImpactGenerator.prepare(); heavyImpactGenerator.impactOccurred()
case "success": notificationGenerator.prepare(); notificationGenerator.notificationOccurred(.success)
case "warning": notificationGenerator.prepare(); notificationGenerator.notificationOccurred(.warning)
case "error": notificationGenerator.prepare(); notificationGenerator.notificationOccurred(.error)
case "soft":
    if #available(iOS 13.0, *) {
        softImpactGenerator?.prepare(); softImpactGenerator?.impactOccurred()
    }
case "rigid":
    if #available(iOS 13.0, *) {
        rigidImpactGenerator?.prepare(); rigidImpactGenerator?.impactOccurred()
    }
case "selection": selectionGenerator.prepare(); selectionGenerator.selectionChanged()
case "vibration": AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
default:
    break
}
  }
}
