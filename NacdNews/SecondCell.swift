//
//  SecondCell.swift
//  NacdNews
//
//  Created by Gregory Weiss on 8/30/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit

class SecondCell: UITableViewCell {
    
    
    @IBOutlet weak var secondTitleLabel: UILabel!
    
    @IBOutlet weak var secondDescriptionLabel: UILabel!
    
    @IBOutlet weak var secondMiscLabel: UILabel!
    
    @IBOutlet weak var secondImageView: UIImageView!
    
    @IBOutlet weak var blogTextView: UITextView!
    
    
    @IBOutlet weak var readMoreButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
