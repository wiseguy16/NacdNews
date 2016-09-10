//
//  VideoDetailViewController.swift
//  NacdNews
//
//  Created by Gregory Weiss on 9/10/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit

class VideoDetailViewController: UIViewController
{
    var aVideo: MediaItem!
    
    
    @IBOutlet weak var videoDetailImageView: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoDescriptionLabel: UILabel!
    @IBOutlet weak var videoMiscLabel: UILabel!

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func playVideoTapped(sender: UIButton)
    {
        
    }

    
    func configureView()
    {
        videoTitleLabel.text = aVideo.title
        videoDescriptionLabel.text = aVideo.channel
        videoMiscLabel.text = aVideo.urltitle
        videoDetailImageView.image = UIImage(named: aVideo.media_image)
    //    videoDetailImageView.image = UIImage(named: "\(aVideo.musicianImage).jpg")
    //    detailFinePrintLabel.text = "Source: 'List of the highest grossing concert tours'. The list for the tour was obtained from Billboard and Pollstar with sales information from promoters and managers who organized the tours."
        
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
