//
//  ArticlesTableCell.swift
//  CEO
//
//  Created by SD on 29/05/2025.
//

import UIKit

class ArticlesTableCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var chevronImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        
        chevronImageView.image = UIImage(systemName: Language.current.isRTL ? "chevron.left" : "chevron.right")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
