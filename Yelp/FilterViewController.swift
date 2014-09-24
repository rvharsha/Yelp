//
//  FilterViewController.swift
//  Yelp
//
//  Created by Harsha Vashisht on 9/23/14.
//  Copyright (c) 2014 Harsha Vashisht. All rights reserved.
//

import UIKit

protocol FilterViewControllerDelegate {
    func searchTermDidChange()
    func dealsFilterSet(is_set : Bool )
}

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var delegate:FilterViewControllerDelegate?
    
    var categoryValues = ["fooddeliveryservices", "bars", "vegan"]
    
    @IBOutlet weak var filterTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterTableView.delegate = self
        filterTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("FilterCell") as FilterCell
        cell.filterLabel.text = "Offering Deals"
        cell.filterViewDelegate = delegate
        cell.filterSwitch.setOn(false, animated: true)
        //cell.section = indexPath.section
        //cell.row = indexPath.row
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView = UIView(frame: CGRect(x:0, y:0, width: 320, height: 40))
        headerView.backgroundColor = UIColor.whiteColor()
        var headerLabel = UILabel(frame: CGRect(x:10, y:0, width:320, height: 40))
        headerLabel.text = "Deals"
        headerView.addSubview(headerLabel)
        return headerView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onCancelAction(sender: AnyObject) {
        dismissViewControllerAnimated(false, completion: nil)
    }

    @IBAction func onSearchAction(sender: AnyObject) {
        self.delegate?.searchTermDidChange()
        dismissViewControllerAnimated(false, completion: nil)
    }
    
    func dealsFilterSet(is_set : Bool ) {
        println("In Filter View Controller")
        self.delegate?.dealsFilterSet(is_set)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
