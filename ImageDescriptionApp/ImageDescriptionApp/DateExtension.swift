import Foundation

extension Date {
    
    /// Method used to convert Date into string with required format.
    func convertIntoString(requiredFormat: AppConstants.DateFormats) -> String {
        // Create Date Formatter
        let dateFormatter = DateFormatter()

        // Set Date Format
        dateFormatter.dateFormat = requiredFormat.dateFormat

        // Convert Date to String
        return dateFormatter.string(from: self)
    }
}
