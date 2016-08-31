//
//  BlogDetailViewController.swift
//  NacdNews
//
//  Created by Gregory Weiss on 8/31/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit
import WebKit

class BlogDetailViewController: UIViewController {
    
    var aBlogItem: BlogItem!
    var shareURL: NSURL!

    @IBOutlet weak var awesomeWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  h ttp://northlandchurch.net/blogs/journey_by_becky_hunter/
        
        let tempString = "http://northlandchurch.net/blogs/\(aBlogItem.urltitle)"
        shareURL = NSURL(string: tempString)
        let request = NSURLRequest(URL: shareURL!)
        awesomeWebView.loadRequest(request)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func shareTapped(sender: UIBarButtonItem)
    {
       // let myData = aDrawing.theImage!
       // let myImage = UIImage(data: myData)
        
        // detailDrawingView.image = myImage
        
        
        let vc = UIActivityViewController(activityItems: [shareURL!], applicationActivities: nil)
        self.presentViewController(vc, animated: true, completion: nil)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
