//
//  FilterCell.swift
//  Yelp
//
//  Created by Harsha Vashisht on 9/23/14.
//  Copyright (c) 2014 Harsha Vashisht. All rights reserved.
//

import UIKit

class FilterCell: UITableViewCell {

    @IBOutlet weak var filterSwitch: UISwitch!
    @IBOutlet weak var filterLabel: UILabel!
    
    var filterViewDelegate:FilterViewControllerDelegate?
    
    @IBAction func onSwitchChangeAction(sender: UISwitch) {
        println("In Filter Cell")
        filterViewDelegate?.dealsFilterSet(sender.on)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
