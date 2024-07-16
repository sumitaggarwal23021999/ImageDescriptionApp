import Foundation
import UIKit

// MARK: - Enum ApiErrorHandler
enum ApiErrorHandler: Error {
    case invalidURL
    case jsonParseError
    case invalidResponse
}

// MARK: - Class APICallHandler
class APICallHandler: ApiFetchHandlerProtocol {
    
    /// Method used to do api calls and get data from backend.
    func handleApiCalls(endPoint: ApiEndPoints) async throws -> [String: Any]? {
        
        //create the new url
        guard let url = URL(string: endPoint.url) else {
            throw ApiErrorHandler.invalidURL
        }
        
        //create a new urlRequest passing the url
        var request = URLRequest(url: url)
        
        //setting the httpMethod
        request.httpMethod = endPoint.method
        
        //declaring that the request will have a JSON
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Use the async variant of URLSession to fetch data
        // Code might suspend here
        let (data, response) = try await URLSession.shared.data(from: url)
        debugPrint("Response received")
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            showAlert()
            throw ApiErrorHandler.invalidResponse
        }
        do {
            if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                return json
            }
        } catch let parseError {
            debugPrint("parsing error: \(parseError)")
            let responseString = String(data: data, encoding: .utf8)
            debugPrint("raw response: \(responseString)")
            showAlert()
            throw ApiErrorHandler.jsonParseError
        }
        return nil
    }
    
    /// Method used to show alert.
    private func showAlert() {
        DispatchQueue.main.async {
            if let delegate = UIApplication.shared.connectedScenes
                .first!.delegate as? SceneDelegate {
                delegate.window!.rootViewController?.showAlertControllerWith(message: .apiFailed, buttons: .ok(nil))
            }
        }
    }
}
