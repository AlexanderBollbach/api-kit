import Foundation

extension URLSessionDataTask: Cancellable {
    
    open override func cancel() {
        self.cancel()
    }
}

public class URLSessionNetwork: Network {
    
    public init() { }
    
    public func perform(request: NetworkRequest, behaviours: [NetworkBehaviour], complete: @escaping (NetworkResult) -> Void) throws -> Cancellable {
    
        
        let task = URLSession.shared.dataTask(with: request.url) { (data, response, error) in
            
            
            complete(NetworkResult.success(NetworkResponse.init(response: response as! HTTPURLResponse, data: data)))

        }
        
        
        task.resume()
        
        
        return task
        
    }
    
    
    public func register(behaviours: [NetworkBehaviour]) {
        
    }
    
    
    
    public func performSync(request: NetworkRequest, behaviours: [NetworkBehaviour]) throws -> NetworkResponse {
        
        fatalError()
    }
}
