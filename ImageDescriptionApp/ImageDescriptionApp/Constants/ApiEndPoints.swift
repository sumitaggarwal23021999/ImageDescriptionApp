import Foundation

enum ApiEndPoints {
    case imageDescription
    
    var url: String {
        switch self {
        case .imageDescription:
            return "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=election&api-key=j5GCulxBywG3lX211ZAPkAB8O381S5SM"
        }
    }
    
    var method: String {
        switch self {
        case .imageDescription:
            return "POST"
        }
    }
    
}
