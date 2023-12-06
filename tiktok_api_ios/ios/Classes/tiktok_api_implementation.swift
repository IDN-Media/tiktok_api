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
        /* Step 2 */
        authRequest.send { response in
            /* Step 3 */
//            let authResponse = response as? TikTokAuthResponse;
            guard let authResponse = response as? TikTokAuthResponse else { return }
            
            if authResponse.errorCode == .noError {
                
//                print("Auth code: \(String(describing: authResponse?.authCode))")
                

                
                completion(Result.success(TikTokLoginResult(status: TikTokLoginStatus.success,
                                                            authCode: authResponse.authCode,
                                                            codeVerifier: authRequest.pkce.codeVerifier)))
                
                
            } else {
                print("Authorization Failed! error: \(String(describing: authResponse.error)), error desc: \(String(describing: authResponse.description))")
                    
                completion(Result.failure(FlutterError(code: String(describing: authResponse.errorCode) , message: authResponse.error, details: authResponse.errorDescription)))
            }
            
        }
        


    }
    
    
}
