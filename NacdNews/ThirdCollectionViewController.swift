//
//  ThirdCollectionViewController.swift
//  NacdNews
//
//  Created by Gregory Weiss on 9/9/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit
import AVFoundation

private let reuseIdentifier = "ThirdCollectionViewCell"

class ThirdCollectionViewController: UICollectionViewController
{
    var audioPlayer: AVAudioPlayer!
    var isPlaying = false
    
    var podcastItems = [Podcast]()
    var myFormatter = NSDateFormatter()


    override func viewDidLoad() {
        super.viewDidLoad()
      //    self.collectionView?.backgroundColor = UIColor(patternImage: UIImage(named: "BgLaunch.png")!)
//        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
//        backgroundImage.image = UIImage(named: "BgLaunch.png")
//        self.view.insertSubview(backgroundImage, atIndex: 0)
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BgLaunch2x.png")!)
        
        
       // self.collectionView?.backgroundView = bgImage
        
        NSKernAttributeName.capitalizedString
        
        myFormatter.dateStyle = .ShortStyle
        myFormatter.timeStyle = .NoStyle
        
        loadPodcasts()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
       // self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool)
    {
//        let bgImage = UIImageView();
//        bgImage.image = UIImage(named: "BgLaunch.png");
//        bgImage.contentMode = .ScaleToFill
//        
//        
//        self.collectionView?.backgroundView = bgImage
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of items
        return podcastItems.count
    }
    
    @IBAction func playPauseTapped(sender: UIButton)
    {
        isPlaying = !isPlaying
//        if audioPlayer.play()
//        {
//          audioPlayer.stop()
//        }
        let contentView = sender.superview
        let cell = contentView?.superview as! ThirdCollectionViewCell
        let thisIndexPath = collectionView?.indexPathForCell(cell)
        let aPodcast = podcastItems[thisIndexPath!.row]
        //sender.c = "To"
        print("This cell")
        
        let audioString = aPodcast.mediaFile
        let audioFilePath =  NSBundle.mainBundle().pathForResource(audioString, ofType: "mp3")
        if audioFilePath != nil {
            let audioFileUrl = NSURL.fileURLWithPath(audioFilePath!) //   .fileURL(withPath: audioFilePath!)
            do {
                audioPlayer =  try AVAudioPlayer(contentsOfURL: audioFileUrl)      //(contentsOf: audioFileUrl)
            } catch let error1 as NSError {
                print(error1)
            }
        }
        if isPlaying
        {
        audioPlayer.play()
        }
        else
        {
           audioPlayer.stop()
        }
        
        collectionView?.reloadData()
       // collectionView?.reloadItemsAtIndexPaths([thisIndexPath!])
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ThirdCollectionViewCell
    
        // Configure the cell
        
        
        let aPodcast = podcastItems[indexPath.row]
      //  var imageData: NSData
        
        cell.titleLabel.text = aPodcast.title
        cell.speakerLabel.text = aPodcast.speaker
        cell.podcastImageView.image = UIImage(named: aPodcast.podcastImage)
        if isPlaying
        {
        cell.playPauseButton.imageView?.image = UIImage(named: "podPauseIcon.png")
        }
        else
        {
            cell.playPauseButton.imageView?.image = UIImage(named: "podPlayIcon.png")
        }
      //  cell.podcastImageView = ??
        
//        cell.firstTitleLabel.text = aMediaThing.title
//        
//        let dateToShow = aMediaThing.entry_date
//        let formattedDateArray = dateToShow.componentsSeparatedByString("-")     //.components(separatedBy: "-")
//        let formattedDateArray2 = formattedDateArray[2].componentsSeparatedByString("T")            //components(separatedBy: "T")
//        let formattedDate = "\(formattedDateArray[1])/\(formattedDateArray2[0])/\(formattedDateArray[0])"
//        
//        cell.firstDescriptionLabel.text = formattedDate
//        
//        //  do
//        //  {
//        if let firstURL = NSURL(string: aMediaThing.media_image)
//        {
//            
//            
//            
//            // let dataFromFile2 = try? Data(contentsOf: URL(fileURLWithPath: filePath!))
//            imageData = NSData(contentsOfURL: firstURL)!   //(contentsOf: (firstURL)!)
//            cell.firstImageView.image = UIImage.init(data: imageData)
//        }
//        //            catch let error {
//        //                print(error)
//        //            }
//        //
//        //    else {
//        //        return
//        //    }
//        // }
//        
//        
//        // cell.firstImageView.image = UIImage.init(data: imageData)
//        cell.firstMiscLabel.text = aMediaThing.channel

    
        return cell
    }
    
    
    func loadPodcasts()
    {
        
        
        let filePath = NSBundle.mainBundle().pathForResource("podcasts", ofType: "json")  //main.path(forResource: "nacdSample3", ofType: "json")
        let dataFromFile2 = NSData(contentsOfFile: filePath!)                   //      (contentsOf: URL(fileURLWithPath: filePath!))
        do
        {
            
            let jsonData = try NSJSONSerialization.JSONObjectWithData(dataFromFile2!, options: [])    //jsonObject(with: dataFromFile2!, options: [])
            
            
            
            guard let jsonDict = jsonData as? [String: AnyObject],
                let itemsArray = jsonDict["items"] as? [[String: AnyObject]]
                //let itemsArray = items1["item"] as? [[String: Any]]
                else
            {
                return
            }
            
            for aPodDict in itemsArray
            {
                let aPodItem = Podcast(myDictionary: aPodDict)
                podcastItems.append(aPodItem)
            }
            // var finalItems = [MediaItem]()
        }
        catch let error as NSError {
            print(error)
        }
    }


    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
