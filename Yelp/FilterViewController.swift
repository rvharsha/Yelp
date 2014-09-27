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
    //func distanceFilterSet(distanceInMeters: Int, rowSelected: Int)
}

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var delegate:FilterViewControllerDelegate?
    
    var categoryValues = ["fooddeliveryservices", "bars", "vegan"]
    var sectionExpanded = [1: false, 2: false, 3: false]
    var distanceCategoriesValue = [0, 482, 1609, 8046, 32186]
    var distanceRowSelected = 0
    
    @IBOutlet weak var filterTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterTableView.delegate = self
        filterTableView.dataSource = self
        filterTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        filterTableView.showsVerticalScrollIndicator = false
        self.navigationItem.title = "Filter"
        // Do any additional setup after loading the view.
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if (indexPath.section == 1) {
            var cell = tableView.dequeueReusableCellWithIdentifier("FilterSelectCell") as FilterSelectCell
            cell.contentView.layer.borderColor = UIColor.blackColor().CGColor
            cell.contentView.layer.cornerRadius = 4.0
            cell.contentView.layer.borderColor = UIColor.grayColor().CGColor
            cell.contentView.layer.borderWidth = 0.5
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell.filterLabel.text = "Distance"
            cell.row = distanceRowSelected
            cell.distanceRowSelected = self.distanceRowSelected
            cell.sectionExpanded = self.sectionExpanded[indexPath.section]!
            cell.filterViewDelegate = delegate
            
            return cell
        }
        
        // Deafult Section is section 0
        var cell = tableView.dequeueReusableCellWithIdentifier("FilterSwitchCell") as FilterSwitchCell
        cell.filterLabel.text = "Offering Deals"
        cell.filterViewDelegate = delegate
        cell.filterSwitch.setOn(false, animated: true)
        cell.contentView.layer.borderColor = UIColor.blackColor().CGColor
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderColor = UIColor.grayColor().CGColor
        cell.contentView.layer.borderWidth = 0.5
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            if (sectionExpanded[section] == true) {
                //Make it return more
                return 3
            }
        }
        
        //Default return 1
        return 1
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        filterTableView.deselectRowAtIndexPath(indexPath, animated: true)
        var section = indexPath.section
        if section == 1 {
            if sectionExpanded[section] == true {
                distanceRowSelected = indexPath.row
                    //self.delegate?.(distanceCategoriesValue[indexPath.row], rowSelected: indexPath.row)
                sectionExpanded[section] = false
            } else {
                sectionExpanded[section] = true
            }
        }
        tableView.reloadSections(NSIndexSet(index: indexPath.section), withRowAnimation: UITableViewRowAnimation.Fade)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var viewHeight = 20
        if section != 0 {
            viewHeight = 40
        }
        
        // Deafult section
        var headerView = UIView(frame: CGRect(x:0, y:0, width: 320, height: viewHeight))
        headerView.backgroundColor = UIColor.whiteColor()
        var headerLabel = UILabel(frame: CGRect(x:10, y:0, width:320, height: viewHeight))
        headerLabel.text = "Deals"
        if section == 1 {
            headerLabel.text = "Distance"
        }
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
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 0) {
            return 20.0
        }
        return 40.0
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
