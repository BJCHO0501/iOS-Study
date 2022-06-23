import UIKit
import Kingfisher
import SwiftUI

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var SearchListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchListTableView.delegate = self
        SearchListTableView.dataSource = self
        let nibname = UINib(nibName: "SearchTableViewCell", bundle: nil)
        SearchListTableView.register(nibname, forCellReuseIdentifier: "resturantCell")
        self.SearchListTableView.rowHeight = 130
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SearchListTableView.dequeueReusableCell(withIdentifier: "resturantCell", for: indexPath) as! SearchTableViewCell
        cell.titleLabel.text = searchData[indexPath.row].maintitle
        cell.addressLabel.text = searchData[indexPath.row].addrestitle
        let url = URL(string: searchData[indexPath.row].mainImage)
        cell.restaurantImagiView.kf.setImage(with: url)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SearchListTableView.deselectRow(at: indexPath, animated: true)
        guard let infoVC = self.storyboard?.instantiateViewController(withIdentifier: "InfoVC") as? InfoViewController else { return }
        infoVC.index = indexPath.row
        navigationController?.pushViewController(infoVC, animated: true)
    }
}
