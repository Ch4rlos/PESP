//
//  TableViewCells.swift
//  PESP
//
//  Created by Developer on 2/19/20.
//  Copyright © 2020 CarlosQuiroga. All rights reserved.
//

import UIKit

class TableViewCells: UITableViewCell {
    
    @IBOutlet weak var nombrePais: UILabel!
    @IBOutlet weak var banderaPais: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
