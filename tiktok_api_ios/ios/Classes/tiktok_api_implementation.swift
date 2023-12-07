import TikTokOpenAuthSDK
import TikTokOpenSDKCore
import Flutter

extension FlutterError: Error {}

public class TiktokSDKApiImplementation : TiktokSDKApi {
    private var controller: UIViewController
    
    public init(controller: UIViewController) {
        self.controller = controller
    }
    

    public func setup(clientKey: String, completion: @escaping (Result<Void, Error>) -> Void) {
        
        
        completion(.success(Void()))
    }
        
    public func login(scopes: [String], redirectUri: String, browserAuthEnabled: Bool?, completion: @escaping (Result<TikTokLoginResult, Error>) -> Void) {
    
        let authRequest = TikTokAuthRequest(scopes: Set(scopes),
                                            redirectURI: redirectUri)
        
            
        authRequest.send();
        
        completion(Result.success(TikTokLoginResult(status: TikTokLoginStatus.success,
                                                    codeVerifier: authRequest.pkce.codeVerifier)))


    }
    
    
}
