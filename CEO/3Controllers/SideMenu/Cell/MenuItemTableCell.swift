//
//  MenuItemTableCell.swift
//  Kastelli
//
//  Created by SD on 19/02/2025.
//

import UIKit

class MenuItemTableCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.accessoryType = .disclosureIndicator
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with menuItem: MenuItem) {
        titleLabel.text = menuItem.title
    }
}
