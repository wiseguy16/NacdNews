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
    
    @IBOutlet weak var blogScrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    var aBlogItem: BlogItem!
    var shareBody: String?
    
    @IBOutlet weak var blogImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var subTextLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    

  //  @IBOutlet weak var awesomeWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shareBody = aBlogItem.body
        //blogScrollView.contentSize = CGSizeMake(400, 2300)
        configureView()
        
        //  h ttp://northlandchurch.net/blogs/journey_by_becky_hunter/
//        
//        let tempString = "http://northlandchurch.net/blogs/\(aBlogItem.urltitle)"
//        shareURL = NSURL(string: tempString)
//        let request = NSURLRequest(URL: shareURL!)
//        awesomeWebView.loadRequest(request)
//        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews();
        
        self.blogScrollView.frame = self.view.bounds; // Instead of using auto layout
        self.blogScrollView.contentSize.height = 3000; // Or whatever you want it to be.
    }
    
//    override func viewDidLayoutSubviews()
//    {
//        let scrollViewBounds = blogScrollView.bounds
//        let contentViewBounds = contentView.bounds
//        
//        var scrollViewInsets = UIEdgeInsetsZero
//        scrollViewInsets.top = scrollViewBounds.size.height/2.0;
//        scrollViewInsets.top -= contentViewBounds.size.height/2.0;
//        
//        scrollViewInsets.bottom = scrollViewBounds.size.height/2.0
//        scrollViewInsets.bottom -= contentViewBounds.size.height/2.0;
//        scrollViewInsets.bottom += 1
//        
//        blogScrollView.contentInset = scrollViewInsets
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func shareTapped(sender: UIBarButtonItem)
//    {
//       // let myData = aDrawing.theImage!
//       // let myImage = UIImage(data: myData)
//        
//        // detailDrawingView.image = myImage
//        
//        
//        let vc = UIActivityViewController(activityItems: [shareURL!], applicationActivities: nil)
//        self.presentViewController(vc, animated: true, completion: nil)
//    }

    
    @IBAction func sharingTapped(sender: UIButton)
    {
        let vc = UIActivityViewController(activityItems: [shareBody!], applicationActivities: nil)
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
    
    func configureView()
    {
        titleLabel.text = aBlogItem.title
        authorLabel.text = aBlogItem.author
        dateLabel.text = aBlogItem.entry_date
        subTextLabel.text = aBlogItem.subText
        bodyLabel.text = aBlogItem.body
        bioLabel.text = aBlogItem.bioDisclaimer
        blogImage.image = UIImage(named: aBlogItem.blog_primary)
        
        
//        videoTitleLabel.text = aVideo.title
//        videoDescriptionLabel.text = aVideo.media_description
//        // videoMiscLabel.text = aVideo.urltitle
//        videoDetailImageView.image = UIImage(named: aVideo.media_image)
//        
//        let dateToShow = aVideo.entry_date
//        let formattedDateArray = dateToShow.componentsSeparatedByString("-")     //.components(separatedBy: "-")
//        let formattedDateArray2 = formattedDateArray[2].componentsSeparatedByString("T")            //components(separatedBy: "T")
//        let formattedDate = "\(formattedDateArray[1])/\(formattedDateArray2[0])/\(formattedDateArray[0])"
//        videoMiscLabel.text = formattedDate
//        //    videoDetailImageView.image = UIImage(named: "\(aVideo.musicianImage).jpg")
//        //    detailFinePrintLabel.text = "Source: 'List of the highest grossing concert tours'. The list for the tour was obtained from Billboard and Pollstar with sales information from promoters and managers who organized the tours."
        
    }


}
