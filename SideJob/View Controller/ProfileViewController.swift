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
        
        // Do any additional setup after loading the view.
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
