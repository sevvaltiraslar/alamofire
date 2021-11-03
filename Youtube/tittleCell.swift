//
//  tittleCell.swift
//  Youtube
//
//  Created by SEVVAL on 28.10.2021.
//

import UIKit

class tittleCell: UITableViewCell {

    
    @IBOutlet weak var tittleImageView: UIImageView!
    @IBOutlet weak var tittleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
