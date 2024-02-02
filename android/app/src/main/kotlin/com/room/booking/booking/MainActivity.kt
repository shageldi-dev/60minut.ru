package com.room.booking.booking

import androidx.annotation.NonNull
import com.yandex.mapkit.MapKitFactory
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine


class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MapKitFactory.setLocale("en_US") // Your preferred language. Not required, defaults to system language
        MapKitFactory.setApiKey("c905255d-2630-4572-ab35-1f3c1ccfeab4") // Your generated API key
        super.configureFlutterEngine(flutterEngine)
    }
}