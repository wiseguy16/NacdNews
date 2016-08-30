//
//  FirstTableViewController.swift
//  NacdNews
//
//  Created by Gregory Weiss on 8/30/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController
{

    var mediaItems = [MediaItem]()
    var myFormatter = NSDateFormatter()
    
    var imageCache = [String:UIImage]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myFormatter.dateStyle = .ShortStyle
        myFormatter.timeStyle = .NoStyle
        loadMediaItems()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mediaItems.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("FirstCell", forIndexPath: indexPath) as! FirstCell

        // Configure the cell...
        
        let aMediaThing = mediaItems[indexPath.row]
        var imageData: NSData
        
        cell.firstTitleLabel.text = aMediaThing.title
        
        let dateToShow = aMediaThing.entry_date
        let formattedDateArray = dateToShow.componentsSeparatedByString("-")     //.components(separatedBy: "-")
        let formattedDateArray2 = formattedDateArray[2].componentsSeparatedByString("T")            //components(separatedBy: "T")
        let formattedDate = "\(formattedDateArray[1])/\(formattedDateArray2[0])/\(formattedDateArray[0])"
        
        cell.firstDescriptionLabel.text = formattedDate
        
      //  do
      //  {
        if let firstURL = NSURL(string: aMediaThing.media_image) {
            
    
            
            // let dataFromFile2 = try? Data(contentsOf: URL(fileURLWithPath: filePath!))
            imageData = NSData(contentsOfURL: firstURL)!   //(contentsOf: (firstURL)!)
            cell.firstImageView.image = UIImage.init(data: imageData)
    }
//            catch let error {
//                print(error)
//            }
//
            //    else {
            //        return
            //    }
       // }
        
       
       // cell.firstImageView.image = UIImage.init(data: imageData)
        cell.firstMiscLabel.text = aMediaThing.channel

        
        

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func loadMediaItems()
    {
        /*
         do
         {
         let filePath = Bundle.main.path(forResource: "nacdSample", ofType: "json")
         let dataFromFile = try? Data(contentsOf: URL(fileURLWithPath: filePath!))
         let mediaItemData: NSArray! = try JSONSerialization.jsonObject(with: dataFromFile!, options: []) as! NSArray
         for mediaItemDictionary in mediaItemData
         {
         let aMediaItem = MediaItem(myDictionary: mediaItemDictionary as! NSDictionary)
         mediaItems.append(aMediaItem)
         }
         }
         catch let error as NSError
         {
         print(error)
         }
         */
        
       
            let filePath = NSBundle.mainBundle().pathForResource("nacdSample3", ofType: "json")  //main.path(forResource: "nacdSample3", ofType: "json")
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

    

}
