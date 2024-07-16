import Foundation
import UIKit

class AppConstants {
    enum DateFormats {
        case imageDescription, imageDescriptionShow
        
        var dateFormat: String {
            switch self {
            case .imageDescription: return "yyyy-MM-dd'T'HH:mm:ssZ"
            case .imageDescriptionShow: return "MMMM YYYY"
            }
        }
    }
    
    enum DefaultImages {
        case placeholder
        
        var image: UIImage {
            switch self {
            case .placeholder: return UIImage(named: "placeholder") ?? UIImage()
            }
        }
    }
    
    enum DefaultStrings {
        case apiFailure, noDataAvailable
        
        var string: String {
            switch self {
            case .apiFailure: return "Something Went Wrong."
            case .noDataAvailable: return "No Data Available"
            }
        }
    }

    static let appName = "ImageDescription"
    static let baseURL = "https://static01.nyt.com/"
}
