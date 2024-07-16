import Foundation

class Utility {
    
    /// Method used to convert string into Date.
    static func convertStringToDae(dateString: String, currentDateFormat: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = currentDateFormat
        let date = dateFormatter.date(from:dateString)
        return date
    }
}
