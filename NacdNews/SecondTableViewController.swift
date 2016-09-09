//
//  SecondTableViewController.swift
//  NacdNews
//
//  Created by Gregory Weiss on 8/30/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit

class SecondTableViewController: UITableViewController
{
    
    var blogItems = [BlogItem]()
    var myFormatter = NSDateFormatter()
    
    var imageCache = [String:UIImage]()
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        myFormatter.dateStyle = .ShortStyle
        myFormatter.timeStyle = .NoStyle
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160
        
        loadBlogs()

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
//        return blogItems.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return blogItems.count
   //     return 1
    }
    @IBAction func readMoreTapped(sender: UIButton)
    {
        let path = NSIndexPath()
        let aBlog = blogItems[path.row]
         aBlog.isExpanded = !aBlog.isExpanded
       
        
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SecondCell", forIndexPath: indexPath) as! SecondCell

        // Configure the cell...
        
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
    

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
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
    
    

}

/*

extension SecondTableViewController {
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 1
        guard let cell = tableView.cellForRowAtIndexPath(indexPath) as? WorkTableViewCell else { return }
        
        var work = selectedArtist.works[indexPath.row]
        
        // 2
        work.isExpanded = !work.isExpanded
        selectedArtist.works[indexPath.row] = work
        
        // 3
        cell.moreInfoTextView.text = work.isExpanded ? work.info : moreInfoText
        cell.moreInfoTextView.textAlignment = work.isExpanded ? .Left : .Center
        
        // 4
        UIView.animateWithDuration(0.3) {
            cell.contentView.layoutIfNeeded()
        }
        
        // 5
        tableView.beginUpdates()
        tableView.endUpdates()
        
        // 6
        tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Top, animated: true)
    }
}
 
 */