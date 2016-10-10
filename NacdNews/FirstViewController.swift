//
//  FirstViewController.swift
//  NacdNews
//
//  Created by Gregory Weiss on 8/30/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController
{
    
    @IBOutlet weak var launchLabel: UILabel!
    @IBOutlet weak var poweredByLabel: UILabel!
    
    var launchString = "LAUNCH"
    var poweredByString = "POWERED BY NORTHLAND"
    var myMutableString1 = NSMutableAttributedString()
    var myMutableString2 = NSMutableAttributedString()
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
         // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

