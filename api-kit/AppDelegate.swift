import UIKit
import ApiKit

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

private struct PostRequest: APIRequest {
    
    
    
    typealias Response = Post
    
    let authenticationRequired = false
    
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func networkRequest(baseUrl: URL) -> NetworkRequest {
        return NetworkRequest(url: baseUrl.appendingPathComponent("/posts/\(id)"))
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let api = API.init(
        network: URLSessionNetwork(),
        configuration: API.Configuration.init(
            baseUrl: URL(string: "https://jsonplaceholder.typicode.com")!,
            commonHeaders: [:],
            authenticationHeaders: { [:] }
        )
    )
    
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        try? api.perform(request: PostRequest.init(id: 1)) { result in
            
            print(result)
        }
        
        return true
    }
}
