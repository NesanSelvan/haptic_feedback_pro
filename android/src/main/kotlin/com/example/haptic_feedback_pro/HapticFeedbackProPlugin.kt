package com.example.haptic_feedback_pro

import android.content.Context
import android.os.Build
import android.os.VibrationEffect
import android.os.Vibrator
import android.os.VibratorManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** HapticFeedbackProPlugin */
class HapticFeedbackProPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "haptic_feedback_pro")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "trigger" -> {
                trigger(call.arguments as String)
                result.success(null)
            }
            else -> result.notImplemented()
        }
    }

    private fun trigger(feedbackType: String) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return
        val effect = when (feedbackType) {
            "light"     -> VibrationEffect.createPredefined(VibrationEffect.EFFECT_TICK)
            "medium"    -> VibrationEffect.createPredefined(VibrationEffect.EFFECT_CLICK)
            "heavy"     -> VibrationEffect.createPredefined(VibrationEffect.EFFECT_HEAVY_CLICK)
            "soft"      -> VibrationEffect.createPredefined(VibrationEffect.EFFECT_TICK)
            "rigid"     -> VibrationEffect.createPredefined(VibrationEffect.EFFECT_HEAVY_CLICK)
            "success"   -> VibrationEffect.createPredefined(VibrationEffect.EFFECT_DOUBLE_CLICK)
            "warning"   -> VibrationEffect.createWaveform(longArrayOf(0, 80, 60, 80), -1)
            "error"     -> VibrationEffect.createWaveform(longArrayOf(0, 100, 50, 100, 50, 100), -1)
            "selection" -> VibrationEffect.createPredefined(VibrationEffect.EFFECT_TICK)
            "vibration" -> VibrationEffect.createOneShot(400, VibrationEffect.DEFAULT_AMPLITUDE)
            else -> return
        }
        vibrate(effect)
    }

    private fun vibrate(effect: VibrationEffect) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            val manager = context.getSystemService(Context.VIBRATOR_MANAGER_SERVICE) as VibratorManager
            manager.defaultVibrator.vibrate(effect)
        } else {
            @Suppress("DEPRECATION")
            val vibrator = context.getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
            vibrator.vibrate(effect)
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
