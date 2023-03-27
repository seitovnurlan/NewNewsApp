//
//  CustomCell.swift
//  NewNewsApp
//
//  Created by Nurlan Seitov on 27/3/23.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var imageCustom: UIImageView!
    
    @IBOutlet weak var labelCustom: UILabel!
    
    @IBOutlet weak var labelCustomText: UILabel!
    
    public func initUI(theme: String, infoTheme: String, image: String) {
        labelCustom.text = theme
        labelCustomText.text = infoTheme
        imageCustom.image = UIImage(named: image)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
