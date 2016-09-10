//
//  FirstCollectionViewController.swift
//  NacdNews
//
//  Created by Gregory Weiss on 9/9/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit

private let reuseIdentifier = "FirstCollectionViewCell"

class FirstCollectionViewController: UICollectionViewController
{
    
    var mediaItems = [MediaItem]()
    var myFormatter = NSDateFormatter()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myFormatter.dateStyle = .ShortStyle
        myFormatter.timeStyle = .NoStyle
        loadMediaItems()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
      //  self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
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
        return mediaItems.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! FirstCollectionViewCell
    
        // Configure the cell
        
        let aMediaThing = mediaItems[indexPath.row]
        var imageData: NSData
        
        cell.firstTitleLabel.text = aMediaThing.title
        
        let dateToShow = aMediaThing.entry_date
        let formattedDateArray = dateToShow.componentsSeparatedByString("-")     //.components(separatedBy: "-")
        let formattedDateArray2 = formattedDateArray[2].componentsSeparatedByString("T")            //components(separatedBy: "T")
        let formattedDate = "\(formattedDateArray[1])/\(formattedDateArray2[0])/\(formattedDateArray[0])"
        
        cell.firstDescriptionLabel.text = formattedDate
        cell.firstImageView.image = UIImage(named: aMediaThing.media_image)
        
        //  do
        //  {
    //    if let firstURL = NSURL(string: aMediaThing.media_image)
    //    {
            
            
            
            // let dataFromFile2 = try? Data(contentsOf: URL(fileURLWithPath: filePath!))
    //        imageData = NSData(contentsOfURL: firstURL)!   //(contentsOf: (firstURL)!)
    //        cell.firstImageView.image = UIImage.init(data: imageData)
    //    }
    
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        
        let aVideoItem = mediaItems[indexPath.row] //as! BlogItem
      
            let detailVC = self.storyboard?.instantiateViewControllerWithIdentifier("VideoDetailViewController") as! VideoDetailViewController
            navigationController?.pushViewController(detailVC, animated: true)
            detailVC.aVideo = aVideoItem
        
        
    }

    
    
        
        func loadMediaItems()
        {
            
            
            let filePath = NSBundle.mainBundle().pathForResource("nacdVideos", ofType: "json")
            let dataFromFile2 = NSData(contentsOfFile: filePath!)
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
                
                for anItemDict in itemsArray
                {
                    let aMediaItem = MediaItem(myDictionary: anItemDict)
                    mediaItems.append(aMediaItem)
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
