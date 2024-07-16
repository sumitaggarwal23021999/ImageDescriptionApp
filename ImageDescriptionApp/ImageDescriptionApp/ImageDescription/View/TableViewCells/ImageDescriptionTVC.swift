import UIKit
import SDWebImage

// MARK: - Class ImageDescriptionTVC
final class ImageDescriptionTVC: UITableViewCell {

    // MARK: Private IBOutlet
    @IBOutlet private weak var imgvw: UIImageView!
    @IBOutlet private weak var lblDate: UILabel!
    @IBOutlet private weak var lblDescription: UILabel!
    @IBOutlet private weak var lblTitle: UILabel!
    
    // MARK: - Variabels
    var imageDetail: ImageDetails? {
        didSet {
            showData()
        }
    }
    
    // MARK: - Private Functions
    private func showData() {
        if let imageDetail = imageDetail {
            lblTitle.text = imageDetail.main
            lblDescription.text = imageDetail.abstract
            if let image = imageDetail.image, let url = URL(string: image) {
                imgvw.sd_setImage(with: url, placeholderImage: AppConstants.DefaultImages.placeholder.image)
            }
            if let pubDate = imageDetail.pubDate {
                lblDate.text = pubDate.convertIntoString(requiredFormat: AppConstants.DateFormats.imageDescriptionShow)
            } else {
                lblDate.text = ""
            }
        }
    }
}
