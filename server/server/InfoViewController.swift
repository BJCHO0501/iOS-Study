import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var roadAdressLabel: UILabel!
    
    var index: Int = 0
    override func viewDidLoad() {
        addressLabel.numberOfLines = 3
        roadAdressLabel.numberOfLines = 3
        super.viewDidLoad()
        titleLabel.text = searchData[index].maintitle
        addressLabel.text = searchData[index].addrestitle
        categoryLabel.text = searchData[index].category
        roadAdressLabel.text = searchData[index].roadAddress
    }
}
