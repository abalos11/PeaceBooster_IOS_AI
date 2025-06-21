//
//  VideosTableCell.swift
//  CEO
//
//  Created by SD on 29/05/2025.
//

import UIKit
import SDWebImage

class VideosTableCell: UITableViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with data: Video) {
        cellImageView.sd_setImage(with: URL(string: "https://img.youtube.com/vi/\(data.videoId)/0.jpg"))
        titleLabel?.text = data.description
    }
}
