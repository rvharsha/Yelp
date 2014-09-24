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
   
    init (dictionary : NSDictionary) {
        println(dictionary["name"])
        println(dictionary["imageUrl"])
        name = dictionary["name"] as? String
        thumbUrl = dictionary["image_url"] as? String
        
    }
}
