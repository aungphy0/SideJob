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
        //self.dateLabel.text = homePost!["date"] as? String
        self.descriptionLabel.text = homePost!["description"] as? String
        
        //to show the date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy 'at' h:mm a" //Your New Date format as per requirement change it own
        let newDate = dateFormatter.string(from: homePost!["date"] as! Date) //pass Date here
        self.dateLabel.text = newDate
        //print(self.dateLabel)
        
        //to show the username
        let user = homePost!["user"] as! PFObject
        let namequery = PFQuery(className:"_User")
        namequery.getObjectInBackground(withId: user.objectId!) { (userData: PFObject?, error: Error?) in
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
    }//viewDidLoad()


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*** ///PICK BUTTON///
    @IBAction func pickButton(_ sender: Any) {
        
        let pick = PFObject(className: "Pick")
        pick["user"] = self.usernameLabel.text
        pick["photo"] = self.photoView.file
        pick["number"] = self.contactNumberLabel.text
        pick["date"] = self.dateLabel.text
        pick["description"] = self.descriptionLabel.text
        pick["pick_user"] = PFUser.current()?.objectId
        
        pick.saveInBackground{ (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            }else{
                print("Pick saved successfully!")
                //pick alert
                let alertController = UIAlertController(title: "Thank You!", message:
                    "You Picked a Job.", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
                
                //self.performSegue(withIdentifier: "cancelSegue", sender: nil)
            }
        }
        
    } ***/  ///PICK BUTTON/// 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
