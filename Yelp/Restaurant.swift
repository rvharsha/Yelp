//
//  Restaurant.swift
//  Yelp
//
//  Created by Harsha Vashisht on 9/23/14.
//  Copyright (c) 2014 Harsha Vashisht. All rights reserved.
//

import UIKit

class Restaurant: NSObject {
    
    var name : String!
    var thumbUrl : String!
    var address : String!
    var cuisine : String!
    var distance : Int!
    var ratingImgUrl : String!
    var reviewCount : Int!
    
   
    init (dictionary : NSDictionary) {
        //println(dictionary)
        name = dictionary["name"] as? String
        thumbUrl = dictionary["image_url"] as? String
        var location = dictionary["location"] as NSDictionary
        address = (location["address"] as [String])[0]
        ratingImgUrl = dictionary["rating_img_url"] as? String
        
        reviewCount = dictionary["review_count"] as? Int
        
        var categories = dictionary["categories"] as [[String]]
        var firstFlag = true
        for category in categories {
            if firstFlag {
                cuisine = category[0]
                firstFlag = false
            } else {
                cuisine = cuisine + ", " + category[0]
            }
        }
        
    }
}
