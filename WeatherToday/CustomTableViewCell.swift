//
//  CustomTableViewCell.swift
//  WeatherToday
//
//  Created by 김천중 on 2022/06/16.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var detailButton: UIButton!
    
    
    
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
