//
//  DetailsViewController.swift
//  SideJob
//
//  Created by AUNG PHYO on 11/12/18.
//  Copyright © 2018 AUNG PHYO. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class DetailsViewController: UIViewController {

   
    var homePost: PFObject!
    
    
    @IBOutlet weak var photoView: PFImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var contactNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print(homePost!)
        //make the photo appear 
        let photo = homePost!["photo"] as! PFObject
        
        let query = PFQuery(className:"Photo")
        query.getObjectInBackground(withId: photo.objectId!) { (photoData: PFObject?, error: Error?) in
            if let error = error {
                //The query returned an error
                print(error.localizedDescription)
            } else {
                //The object has been retrieved
                self.photoView.file = photoData!["image"] as? PFFile
                self.photoView.loadInBackground()
                
            }
        }
        
        
        self.contactNumberLabel.text = homePost!["number"] as? String
        self.dateLabel.text = homePost!["date"] as? String
        self.descriptionLabel.text = homePost!["description"] as? String
        
        //to show the date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy" //Your New Date format as per requirement change it own
        let newDate = dateFormatter.string(from: homePost!["date"] as! Date) //pass Date here
        self.dateLabel.text = newDate
        //print(self.dateLabel)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
