-keep class com.tencent.** { *; }
-keep class com.google.gson.** { *; }
-dontwarn com.tencent.**
-keep class repeackage.com.uodis.opendevice.aidl.** { *; }
-keep interface repeackage.com.uodis.opendevice.aidl.** { *; }
-keep class repeackage.com.asus.msa.SupplementaryDID.** { *; }
-keep interface repeackage.com.asus.msa.SupplementaryDID.** { *; }
-keep class repeackage.com.bun.lib.** { *; }
-keep interface repeackage.com.bun.lib.** { *; }
-keep class repeackage.com.heytap.openid.** { *; }
-keep interface repeackage.com.heytap.openid.** { *; }
-keep class repeackage.com.samsung.android.deviceidservice.** { *; }
-keep interface repeackage.com.samsung.android.deviceidservice.** { *; }
-keep class repeackage.com.zui.deviceidservice.** { *; }
-keep interface repeackage.com.zui.deviceidservice.** { *; }
-keep class repeackage.com.coolpad.deviceidsupport.** { *; }
-keep interface repeackage.com.coolpad.deviceidsupport.** { *; }
-keep class repeackage.com.android.creator.** { *; }
-keep interface repeackage.com.android.creator.** { *; }
-keep class repeackage.com.google.android.gms.ads.identifier.internal.** { *; }
-keep interface repeackage.com.google.android.gms.ads.identifier.internal.* { *; }
-keep class repeackage.com.oplus.stdid.** {*; }
-keep interface repeackage.com.oplus.stdid.** {*; }
-keep class com.huawei.hms.ads.** {*; }
-keep interface com.huawei.hms.ads.** {*; }
-keep class com.hihonor.ads.** {*; }
-keep interface com.hihonor.ads.** {*; }
-keep class repeackage.com.qiku.id.** { *; }
-keep interface repeackage.com.qiku.id.** { *; }
-keep class org.tensorflow.lite.** { *; }
-dontwarn org.tensorflow.lite.**

# Flutter & Dart
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-dontwarn io.flutter.embedding.**

# Keep native method names for JNI
-keepclasseswithmembernames class * {
    native <methods>;
}

# Rust FFI & Cargokit
-keep class com.flutter_rust_bridge.** { *; }
-keep class * implements com.flutter_rust_bridge.** { *; }
-keep class cargokit.** { *; }

# OAID
-keep class com.github.gzuliyujiang.** { *; }

# Isar Database
-keep class dev.isar.** { *; }

# WebDAV
-keep class org.xmlpull.** { *; }
-dontwarn org.xmlpull.**

# ExoPlayer / Media3
-keep class com.google.android.exoplayer2.** { *; }
-keep class androidx.media3.** { *; }
-dontwarn com.google.android.exoplayer2.**

# ML Kit (mobile_scanner)
-keep class com.google.mlkit.** { *; }
-dontwarn com.google.mlkit.**

# Keep Kotlin metadata
-keep class kotlin.Metadata { *; }
-dontwarn kotlin.**

# Keep annotations
-keepattributes Signature
-keepattributes *Annotation*