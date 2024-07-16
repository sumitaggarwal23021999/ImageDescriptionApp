import Foundation
import SVProgressHUD

// MARK: - Protocol ImageDescrptionDataHandlerProtocol
protocol ImageDescrptionDataHandlerProtocol {
    
    /// Method used to fetch Images data.
    func fetchImagesData() async throws -> [ImageDetails]?
}

// MARK: - Protocol ImageDescriptionViewModelServices
protocol ImageDescriptionViewModelServices: AnyObject {
    
    /// Method used to reload view once receive data.
    func reloadData()
}

// MARK: - Class ImageDescriptionViewModel
class ImageDescriptionViewModel {
    
    // MARK: - Variables
    var imageDetailsList: [ImageDetails]? {
        didSet {
            delegate?.reloadData()
        }
    }
    weak var delegate: ImageDescriptionViewModelServices?
    var imageDescrptionDataHandler: ImageDescrptionDataHandlerProtocol?
    
    // MARK: - Custom Constructor
    init(
        delegate: ImageDescriptionViewModelServices? = nil,
        imageDescrptionDataHandler: ImageDescrptionDataHandlerProtocol? = nil
    ) {
        self.delegate = delegate
        self.imageDescrptionDataHandler = imageDescrptionDataHandler
    }
    
    /// Method used to fetch images data.
    func fetchImagesData() {
        // Start an async task
        SVProgressHUD.show()
        Task {
            do {
                imageDetailsList = try await imageDescrptionDataHandler?.fetchImagesData()
                sortImageListing()
                await SVProgressHUD.dismiss()
            } catch {
                await SVProgressHUD.dismiss()
                debugPrint("Request failed with error: \(error)")
            }
        }
    }
    
    /// Method used to sort Images on the basis of data.
    private func sortImageListing() {
        imageDetailsList = imageDetailsList?.sorted(by: {
            ($0.pubDate ?? Date()) > ($1.pubDate ?? Date())
        })
    }
}
