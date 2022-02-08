package hd.fullhd.wallpaper.wallpaper

import android.util.Log
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class SetBackgroundMethodChannel(messenger: BinaryMessenger, private val action: (path: String) -> Unit) : MethodChannel(messenger, "channel-update-wallpaper"), MethodChannel.MethodCallHandler {
    init {
        setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method){
            "set-background" -> action.invoke(call.arguments.toString())
        }
    }
}