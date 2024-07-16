import Foundation 

// MARK: - Protocol ApiFetchHandlerProtocol
protocol ApiFetchHandlerProtocol {
    func handleApiCalls(endPoint: ApiEndPoints) async throws -> [String: Any]?
}

// MARK: - Class ImageDescrptionDataHandlerAPI
class ImageDescrptionDataHandlerAPI: ImageDescrptionDataHandlerProtocol {
    
    // MARK: - Variables
    var apiHandler: ApiFetchHandlerProtocol?
    
    // MARK: - Custom Constructor
    init(apiHandler: ApiFetchHandlerProtocol?) {
        self.apiHandler = apiHandler
    }
    
    /// Method used to handle data fetch.
    func fetchImagesData() async throws -> [ImageDetails]? {
        guard let apiResponse = try await apiHandler?.handleApiCalls(endPoint: .imageDescription) else {
            return nil
        }
        debugPrint(apiResponse)
        if
            let response = apiResponse["response"] as? [String: Any],
            let docs = response["docs"] as? [[String: Any]]
        {
            let imageDetailsList = docs.map({
                ImageDetails(responseData: $0)
            })
            return imageDetailsList
        }
        return nil
    }
}
