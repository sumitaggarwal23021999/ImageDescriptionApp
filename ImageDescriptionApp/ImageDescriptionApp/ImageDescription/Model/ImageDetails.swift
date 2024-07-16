import Foundation

// MARK: Class ImageDetails
class ImageDetails {
    
    // MARK: - Public Variables
    var abstract : String?
    var pubDate : Date?
    var main : String?
    var image: String?
    
    // MARK: - Custom Constructors
    init(
        abstract: String? = nil,
        pubDate: Date? = nil,
        main: String? = nil,
        image: String? = nil
    ) {
        self.abstract = abstract
        self.pubDate = pubDate
        self.main = main
        self.image = image
    }
    
    /// Method used to parse API Data.
    init(responseData: [String: Any]) {
        abstract = responseData["abstract"] as? String
        if let date = responseData["pub_date"] as? String {
            pubDate = Utility.convertStringToDae(dateString: date, currentDateFormat: AppConstants.DateFormats.imageDescription.dateFormat)
        }
        if let headLine = responseData["headline"] as? [String: Any] {
            main = headLine["main"] as? String
        }
        if 
            let multiMedia = responseData["multimedia"] as? [[String: Any]],
            let first = multiMedia.first,
            let imageURL = first["url"] as? String
        {
            image = "\(AppConstants.baseURL)\(imageURL)"
        }
    }    
}
