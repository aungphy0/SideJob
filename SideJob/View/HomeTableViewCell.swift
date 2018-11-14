//
//  HomeTableViewCell.swift
//  SideJob
//
//  Created by AUNG PHYO on 11/10/18.
//  Copyright © 2018 AUNG PHYO. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class HomeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var photoView: PFImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var captionLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var homePost: PFObject! {
        didSet {
            let username = homePost["user"] as! PFObject
            //self.usernameLabel.text = username.objectId
            
            let query = PFQuery(className:"_User")
            query.getObjectInBackground(withId: username.objectId!) { (userData: PFObject?, error: Error?) in
                if let error = error {
                    //The query returned an error
                    print(error.localizedDescription)
                } else {
                    //The object has been retrieved
                    //print(userData!["username"])
                    let name = userData!["username"]
                    self.usernameLabel.text = name as? String
                }
            }
            
            //to show the date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy" //Your New Date format as per requirement change it own
            let newDate = dateFormatter.string(from: homePost!["date"] as! Date) //pass Date here
            self.dateLabel.text = newDate
            
            self.captionLabel.text = homePost["caption"] as? String
            self.locationLabel.text = homePost["location"] as? String
           
            let photo = homePost["photo"] as! PFObject
            self.photoView.file = photo["image"] as? PFFile
            self.photoView.loadInBackground()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
