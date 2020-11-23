//
//  AlbumTableViewCell.swift
//  DemoPhoto
//
//  Created by PhanDinhNguyen on 11/20/20.
//  Copyright © 2020 PhanDinhNguyen. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    

    @IBOutlet weak var avartarView: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
