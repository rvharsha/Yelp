//
//  RestaurantViewController.swift
//  Yelp
//
//  Created by Harsha Vashisht on 9/23/14.
//  Copyright (c) 2014 Harsha Vashisht. All rights reserved.
//

import UIKit

class RestaurantsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FilterViewControllerDelegate, UISearchBarDelegate {

    // You can register for Yelp API keys here: http://www.yelp.com/developers/manage_api_keys
    let yelpConsumerKey = "KhP7fy8cGpj4EsR3C_Z_FA"
    let yelpConsumerSecret = "8EtSdku6jtS_a44I1-apDg7f254"
    let yelpToken = "LImjtVlZf4tvFFEgBGO7YsWGQJmU_m52"
    let yelpTokenSecret = "Ay-oYF6wvoaCvmOzM3SIGhUop4k"
    
    // Yelp API Client
    var client: YelpClient!
    var restaurants : [Restaurant] = []
    
    
    @IBOutlet weak var restaurantSearchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchUIView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        restaurantSearchBar.delegate = self
        
        loadYelpData("thai")
        self.navigationController!.navigationBar.barStyle = UIBarStyle.BlackTranslucent
        self.navigationController!.navigationBar.tintColor = UIColor(red: 196.0/255.0, green: 18.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 196.0/255.0, green: 18.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        //searchUIView.backgroundColor = UIColor.redColor()
        
        restaurantSearchBar.tintColor =  UIColor(red: 196.0/255.0, green: 18.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        restaurantSearchBar.barTintColor =  UIColor(red: 196.0/255.0, green: 18.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        
        //self.tableView.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("RestaurantCell") as RestaurantCell
        cell.restaurant = self.restaurants[indexPath.row]
        return cell
    }
    
    
    func loadYelpData(query: String) {
        client =  YelpClient(consumerKey: self.yelpConsumerKey, consumerSecret: self.yelpConsumerSecret, accessToken: self.yelpToken, accessSecret: self.yelpTokenSecret)
        client.searchWithTerm(query, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            //println(response)
            var restaurantDictionaries = response["businesses"] as [NSDictionary]
            
            self.restaurants = restaurantDictionaries.map({ (business : NSDictionary) -> Restaurant in
                Restaurant(dictionary: business)
            })
            self.tableView.reloadData()
            }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        }
    }

    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        loadYelpData(restaurantSearchBar.text)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        var filtersNavigationController = segue.destinationViewController as UINavigationController
        var filterViewController = filtersNavigationController.viewControllers[0] as FilterViewController
        filterViewController.delegate = self        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
    func searchTermDidChange() {
        println("Search Term Changed")
    }
    

}
