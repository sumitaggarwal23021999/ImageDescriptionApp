import UIKit

// MARK: - Class ImageDescriptorVC
final class ImageDescriptorVC: UIViewController {
    
    // MARK: Private IBOutlet
    @IBOutlet private weak var tblvwImageList: UITableView!
    
    // MARK: Private Variable
    private var viewModel: ImageDescriptionViewModel?

    // MARK: - Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        registerDelegateAndDataSource()
        viewModel = ImageDescriptionViewModel(
            delegate: self,
            imageDescrptionDataHandler: ImageDescrptionDataHandlerAPI(apiHandler: APICallHandler())
        )
        viewModel?.fetchImagesData()
    }
    
    /// Method used to set Delegate and DataSource.
    private func registerDelegateAndDataSource() {
        tblvwImageList.delegate = self
        tblvwImageList.dataSource = self
    }
}

// MARK: - Extension ImageDescriptorVC UITableViewDelegate, UITableViewDataSource
extension ImageDescriptorVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.imageDetailsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageDescriptionTVC", for: indexPath) as! ImageDescriptionTVC
        cell.imageDetail = viewModel?.imageDetailsList?[indexPath.row]
        return cell
    }
}

// MARK: - Extension ImageDescriptorVC ImageDescriptionViewModelServices
extension ImageDescriptorVC: ImageDescriptionViewModelServices {
    func reloadData() {
        DispatchQueue.main.async {
            self.tblvwImageList.reloadData()
        }
    }
}
