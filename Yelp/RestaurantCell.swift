//
//  RestaurantCell.swift
//  Yelp
//
//  Created by Harsha Vashisht on 9/23/14.
//  Copyright (c) 2014 Harsha Vashisht. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {

    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var thumbView: UIImageView!
    @IBOutlet weak var numberOfReviewsLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var cuisineLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    var restaurant : Restaurant!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        nameLabel.text = restaurant.name
        addressLabel.text = restaurant.address
        numberOfReviewsLabel.text = "\(restaurant.reviewCount) Reviews"
        if let listingImageUrl = restaurant.thumbUrl {
            thumbView.setImageWithURL(NSURL(string : listingImageUrl))
            thumbView.layer.cornerRadius = 5
            thumbView.clipsToBounds = true;
        }
        
        if let ratingImageUrl = restaurant.ratingImgUrl {
            ratingImageView.setImageWithURL(NSURL(string: ratingImageUrl))
        }

    }

}
