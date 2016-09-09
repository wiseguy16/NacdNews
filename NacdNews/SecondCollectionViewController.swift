//
//  SecondCollectionViewController.swift
//  NacdNews
//
//  Created by Gregory Weiss on 9/9/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit

private let reuseIdentifier = "SecondCollectionViewCell"

class SecondCollectionViewController: UICollectionViewController
{
    
    var blogItems = [BlogItem]()
    var myFormatter = NSDateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myFormatter.dateStyle = .ShortStyle
        myFormatter.timeStyle = .NoStyle
        
        loadBlogs()


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
     //   self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

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

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return blogItems.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! SecondCollectionViewCell
    
        // Configure the cell
        
        let aBlog = blogItems[indexPath.row]
        var imageData: NSData
        
        cell.secondTitleLabel.text = aBlog.title
        
        let dateToShow = aBlog.entry_date
        let formattedDateArray = dateToShow.componentsSeparatedByString("-")     //.components(separatedBy: "-")
        let formattedDateArray2 = formattedDateArray[2].componentsSeparatedByString("T")            //components(separatedBy: "T")
        let formattedDate = "\(formattedDateArray[1])/\(formattedDateArray2[0])/\(formattedDateArray[0])"
        
        cell.secondDescriptionLabel.text = formattedDate
        
        if let firstURL = NSURL(string: aBlog.blog_primary) {
            
            
            
            // let dataFromFile2 = try? Data(contentsOf: URL(fileURLWithPath: filePath!))
            imageData = NSData(contentsOfURL: firstURL)!   //(contentsOf: (firstURL)!)
            cell.secondImageView.image = UIImage.init(data: imageData)
        }
        
        //        if aBlog.isExpanded == true
        //        {
        //            print(aBlog.isExpanded)
        //
        let str = aBlog.channel
        let nsString = str as NSString
        if nsString.length > 0
        {
            cell.secondMiscLabel.text? = nsString.substringWithRange(NSRange(location: 0, length: nsString.length > 160 ? 160 : nsString.length))
        }
            //    }
        else
        {
            cell.secondMiscLabel.text? = aBlog.channel
            
        }

        
        
    
        return cell
    }
    
    func loadBlogs()
    {
        
        
        let filePath = NSBundle.mainBundle().pathForResource("nacdBlog2", ofType: "json")  //main.path(forResource: "nacdSample3", ofType: "json")
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
            
            for aBlogDict in itemsArray
            {
                let aBlogItem = BlogItem(myDictionary: aBlogDict)
                blogItems.append(aBlogItem)
            }
            // var finalItems = [MediaItem]()
        }
        catch let error as NSError {
            print(error)
        }
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
   
        //
        let aBlog = blogItems[indexPath.row] //as! BlogItem
        print("\(aBlog.isExpanded)")
        // aBlog.isExpanded = true ? false: true
        aBlog.isExpanded = !aBlog.isExpanded
        
        if aBlog.isExpanded == false
        {
            let detailVC = self.storyboard?.instantiateViewControllerWithIdentifier("BlogDetailViewController") as! BlogDetailViewController
            navigationController?.pushViewController(detailVC, animated: true)
            detailVC.aBlogItem = aBlog
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
