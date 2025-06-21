//
//  MyChatTableCell.swift
//  WCWC
//
//  Created by SD on 19/05/2025.
//  Copyright © 2025 iStart17. All rights reserved.
//

import UIKit

class MyChatTableCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
