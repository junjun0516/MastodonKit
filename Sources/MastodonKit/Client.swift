import Foundation

public final class Client {
    let baseURL: String
    public var accessToken: String?
    lazy var session = URLSession.shared

    public init(baseURL: String, accessToken: String? = nil) {
        self.baseURL = baseURL
        self.accessToken = accessToken
    }

    public func run<Model>(_ resource: Resource<Model>, completion: @escaping (Model?, Error?) -> Void) {
        let components = URLComponents(baseURL: baseURL, resource: resource)

        var request = URLRequest(url: components.url!, timeoutInterval: 30)
        request.httpMethod = resource.httpMethod.rawValue
        request.setValue(accessToken.flatMap { "Bearer \($0)" }, forHTTPHeaderField: "Authorization")

        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }

            guard
                let data = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: data, options: [])
                else {
                    completion(nil, ClientError.dataError)
                    return
            }

            guard
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200
                else {
                    let mastodonError = MastodonError(json: jsonObject)
                    completion(nil, ClientError.mastodonError(mastodonError.description))
                    return
            }

            completion(resource.parse(jsonObject), nil)
        }

        task.resume()
    }
    
    public func getURL<Model>(_ resource: Resource<Model>) -> URL {
        let components = URLComponents(baseURL: self.baseURL, resource: resource)
        return components.url!
    }
    
}
