package id.ice.tiktok_api_android


import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar


/** TiktokApiAndroidPlugin */
class TiktokApiAndroidPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {

  lateinit var  _binaryMessenger : BinaryMessenger;

  @Suppress("deprecation")
  fun registerWith(registrar: Registrar) {
    if (registrar.activity() == null) {
      return;
    }
    val instance = TiktokAPISDKImplementation(registrar.activity()!!)

    TiktokSDKApi.setUp(registrar.messenger(), instance)
  }

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    _binaryMessenger = binding.binaryMessenger;
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {

  }

  override fun onMethodCall(call: MethodCall, result: Result) {

  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    val instance = TiktokAPISDKImplementation(binding.activity)


    TiktokSDKApi.setUp(_binaryMessenger, instance)

  }

  override fun onDetachedFromActivityForConfigChanges() {

  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {

  }

  override fun onDetachedFromActivity() {

  }


}
