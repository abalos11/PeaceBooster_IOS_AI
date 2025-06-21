//
//  FAQsTableCell.swift
//  CEO
//
//  Created by SD on 29/05/2025.
//

import UIKit

class FAQsTableCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var chevronImageView: UIImageView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var innerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.topView.layer.cornerRadius = 16
        self.topView.layer.maskedCorners = [.leadingTop, .trailingTop]
        self.innerView.isHidden = !selected
        self.chevronImageView.image = UIImage(systemName: selected ? "chevron.up" : "chevron.down")
        (self.superview as? UITableView)?.beginUpdates()
        (self.superview as? UITableView)?.endUpdates()
    }
    
    @IBAction func toggleButton(_ sender: Any) {
        innerView.isHidden.toggle()
    }
}
