//
//  FilterSelectCell.swift
//  Yelp
//
//  Created by Harsha Vashisht on 9/25/14.
//  Copyright (c) 2014 Harsha Vashisht. All rights reserved.
//

import UIKit

class FilterSelectCell: UITableViewCell {

    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var downImageView: UIImageView!
    @IBOutlet weak var uncheckImageView: UIImageView!
    
    var filterViewDelegate:FilterViewControllerDelegate?
    var sectionExpanded = false
    var isRowSelected = false
    var section = -1
    var row = -1
    var distanceRowSelected = 0
    
    var distanceCategories = ["Auto", "0.3 miles", "1 mile", "5 miles", "20 miles"]
    
    //@IBOutlet weak var uncheckFilterImageView: UIImageView!
    @IBOutlet weak var filterLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        self.categoryLabel.sizeToFit()
        if section == 1 {
            categoryLabel.text = "Distance"
            if (row == distanceRowSelected) {
                isRowSelected = true
            } else {
                isRowSelected = false
            }
        }
        
        if (sectionExpanded) {
            downImageView.hidden = true
            if (isRowSelected) {
                checkImageView.hidden = false
                uncheckImageView.hidden = true
            } else {
                checkImageView.hidden = true
                uncheckImageView.hidden = false
            }
        } else {
            checkImageView.hidden = true
            uncheckImageView.hidden = true
            downImageView.hidden = false
        }

    }

}
