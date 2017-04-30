import Foundation

public struct Clients {
    /// Registers an application.
    ///
    /// - Parameters:
    ///   - appName: Name of your application.
    ///   - redirectURI: Where the user should be redirected after authorization (for no redirect, omit this parameter).
    ///   - scopes: Application's access scopes.
    ///   - website: URL to the homepage of your app.
    /// - Returns: Resource for `ClientApplication`.
    public static func register(clientName: String, redirectURI: String = "urn:ietf:wg:oauth:2.0:oob", scopes: [AccessScope], website: String? = nil) -> ClientApplicationResource {
        let dictionary: [String : String?] = [
            "client_name": clientName,
            "redirect_uris": redirectURI,
            "website": website,
            "scopes": scopes.map(toString).joined(separator: "+")
        ]

        let parameters = dictionary.flatMap(toQueryItem)

        return ClientApplicationResource(path: "/api/v1/apps", parameters: parameters, method: .post, parse: ClientApplicationResource.parser)
    }
    
    /// confirm an application.
    ///
    /// - Parameters:
    ///   - clientId: client id which returns from server when regisering your app.
    ///   - redirectURI: Where the user should be redirected after authorization (for no redirect, omit this parameter).
    ///   - responseType: OAuth2.0 repsponse type.
    ///   - scopes: Application's access scopes.
    /// - Returns: Resource for `ClientApplication`.
    
    public static func confirmOAuthorize(clientId: String, redirectURI: String = "urn:ietf:wg:oauth:2.0:oob", responseType: String = "code", scopes: [AccessScope]) -> ClientApplicationResource {
        let dictionary: [String: String?] = [
            "client_id": clientId,
            "response_type": responseType,
            "redirect_uri": redirectURI,
            "scope": scopes.map(toString).joined(separator: " ")
        ]
        
        let parameters = dictionary.flatMap(toQueryItem)
        return ClientApplicationResource(path: "/oauth/authorize", parameters: parameters, method: .get, parse: ClientApplicationResource.parser)
    }
}
