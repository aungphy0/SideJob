//
//  ProfileViewController.swift
//  SideJob
//
//  Created by AUNG PHYO on 11/10/18.
//  Copyright © 2018 AUNG PHYO. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {
    
    
    
    @IBOutlet weak var profileUsername: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    @IBAction func logoutButon(_ sender: Any) {
        PFUser.logOutInBackground(block : { (error) in
            if let error = error {
                print(error.localizedDescription)
            }else{
                print("User Logout Successfully")
                self.performSegue(withIdentifier: "loginViewSegue", sender: nil)
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.dataSource = self
        //self.tableView.rowHeight = 200
        //self.tableView.estimatedRowHeight = UITableViewAutomaticDimension
        let profileData = PFUser.current()
        print(profileData?.username! as Any)
        print(profileData?.email! as Any)
        self.profileUsername.text = profileData?.username
        self.userEmail.text = profileData?.email
        self.userEmail.sizeToFit()
        self.userEmail.textAlignment = NSTextAlignment.center
    }
    
    /***
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobInProfile", for: indexPath) as! ProfileTableViewCell
        return cell
    } ***/
    
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
