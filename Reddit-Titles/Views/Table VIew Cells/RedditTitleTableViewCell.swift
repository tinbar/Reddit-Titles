//
//  RedditTitleTableViewCell.swift
//  Reddit-Titles
//
//  Created by Atindra Ganeshen on 2018-05-19.
//  Copyright © 2018 Atindra Ganeshen. All rights reserved.
//

import UIKit

class RedditTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var redditTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        redditTitleLabel.text = nil
    }
    
}
