//
//  SearchTableViewCell.swift
//  server
//
//  Created by 조병진 on 2022/06/10.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var restaurantImagiView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        restaurantImagiView.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
