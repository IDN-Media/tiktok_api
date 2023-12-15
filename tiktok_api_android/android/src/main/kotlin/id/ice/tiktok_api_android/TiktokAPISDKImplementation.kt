package id.ice.tiktok_api_android


import android.app.Activity
import com.tiktok.open.sdk.auth.AuthApi
import com.tiktok.open.sdk.auth.AuthRequest
import com.tiktok.open.sdk.auth.utils.PKCEUtils
import android.content.Intent
import android.net.Uri
import android.os.Bundle

public  class TiktokAPISDKImplementation(val _activity: Activity): TiktokSDKApi{

  var activity: Activity;
  private lateinit var authApi: AuthApi
  private lateinit var clientKey: String


  init {
      this.activity = _activity;
  }

  override fun setup(clientKey: String, callback: (Result<Unit>) -> Unit) {

    if  (this.activity == null) {
      callback(Result.failure(exception = UnsupportedOperationException()))
      return
    }

    this.clientKey = clientKey
    this.authApi = AuthApi(activity = this.activity)


//    assert(this.authApi != null){"this.authApi is null" }

    callback(Result.success(Unit))
  }

  override fun login(
    permissions: List<String>,
    redirectUri: String,
    browserAuthEnabled: Boolean?,
    callback: (Result<TikTokLoginResult>) -> Unit
  ) {
    val codeVerifier = PKCEUtils.generateCodeVerifier()

    val request = AuthRequest(
      clientKey = clientKey,
      scope = permissions.joinToString(","),
      redirectUri = redirectUri,
      codeVerifier = codeVerifier
    )


// STEP 3: Invoke the authorize method
    val isLoginSuccess = authApi.authorize(
      request = request,
      authMethod = AuthApi.AuthMethod.TikTokApp // AuthApi.AuthMethod.TikTokApp // / AuthMethod.ChromeTab
    );

    val response = authApi.getAuthResponseFromIntent(
      intent = _activity.intent, redirectUrl = redirectUri );



    var loginStatus: TikTokLoginStatus = TikTokLoginStatus.SUCCESS
    if(!isLoginSuccess){
      loginStatus = TikTokLoginStatus.ERROR
    }

     callback(Result.success(
       TikTokLoginResult(
         status = loginStatus,
         codeVerifier = codeVerifier,
         
       )
     ))
  }




}