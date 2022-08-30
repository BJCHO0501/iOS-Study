import UIKit
import Alamofire

var searchData = [tableSearchData]()


class ViewController: UIViewController {
    
    @IBOutlet weak var searchTitleTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    private let httpClient = HTTPClient()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func searchRest(matjip: String) {
        httpClient.get(
            url: AuthAPI.search.path(),
            params: ["matjip" : "\(matjip)"],
            header: Header.tokenIsEmpty.header()
        ).responseJSON(completionHandler: { res in
            switch res.response?.statusCode {
            case 200:
                guard let searchStoryBoard = self.storyboard?.instantiateViewController(identifier: "searchVC") as? SearchViewController else { return }
                do {
                    let model = try JSONDecoder().decode(searchRestaurant.self, from: res.data!)
                    searchData = model.searchResult.map {
                        let title = $0.title
                        let subtitle = $0.address
                        let image = $0.imageLink
                        let category = $0.category
                        let homePageLink = $0.homePageLink
                        let roadAddress = $0.roadAddress
                        
                        return tableSearchData(maintext: title, addresstext: subtitle, image: image, category: category, homePageLink: homePageLink, roadAddress: roadAddress)
                    }
                    self.navigationController?.pushViewController(searchStoryBoard, animated: true)
                }
                catch {
                    print(error)
                }
            default:
                print(res.response?.statusCode ?? "0")
            }
        })
    }
    
    @IBAction func getButtonDidTap(_ sender: UIButton) {
        guard let searchTitle = searchTitleTextField.text,
              searchTitle.isEmpty == true else {
                  searchRest(matjip: searchTitleTextField.text!)
                  return
              }
    }
}
