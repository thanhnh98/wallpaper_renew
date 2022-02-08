package hd.fullhd.wallpaper.wallpaper

import android.content.Intent
import android.net.Uri
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import java.io.File
import androidx.core.app.ActivityCompat.startActivityForResult
import androidx.core.content.FileProvider


class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        SetBackgroundMethodChannel(flutterEngine.dartExecutor.binaryMessenger){ path ->
            val chooserIntent: Intent = Intent.createChooser(createIntentByPath(path), "Set as: ")
            chooserIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            applicationContext.startActivity(chooserIntent)
        }
    }

    private fun createIntentByPath(path: String): Intent {
        val file = File(path)
        return Intent(Intent.ACTION_ATTACH_DATA)
            .addCategory(Intent.CATEGORY_DEFAULT)
            .setDataAndType(
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N){
                    FileProvider.getUriForFile(this, "$packageName.provider", file)
                }
                else
                    Uri.fromFile(file),
                "image/*"
            )
            .putExtra("mimeType", "image/jpeg")
            .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
    }
}
