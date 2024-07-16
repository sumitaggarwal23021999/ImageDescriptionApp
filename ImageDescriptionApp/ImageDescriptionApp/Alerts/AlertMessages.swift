import Foundation

enum AlertMessages {
    case custom(String)
    case apiFailed
    case noDataAvailable
    
    var value: String {
        switch self {
        case .custom(let message): return message
        case .apiFailed: return AppConstants.DefaultStrings.apiFailure.string
        case .noDataAvailable: return AppConstants.DefaultStrings.noDataAvailable.string
        }
    }
}
