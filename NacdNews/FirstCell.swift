//
//  FirstCell.swift
//  NacdNews
//
//  Created by Gregory Weiss on 8/30/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit

class FirstCell: UITableViewCell
{
    
    @IBOutlet weak var firstTitleLabel: UILabel!
    
    @IBOutlet weak var firstDescriptionLabel: UILabel!
    
    @IBOutlet weak var firstMiscLabel: UILabel!
    
    @IBOutlet weak var firstImageView: UIImageView!
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
