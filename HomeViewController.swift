//
//  HomeViewController.swift
//  StudentPortal
//
//  Created by IACD-02 on 2022/07/14.
//

import UIKit
import Firebase
import FirebaseDatabase


//MARK: HOME / POSTS class

class HomeViewController: UIViewController {

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        //The code below logs out the user before it tries check if the user is logged in. Block Comment it out to help with the development process so not login everytime you run the app.
        //When you comment out the code remember to also change the intial view controller from the login screen  to the tab bar controller.
        
        
        //DO NOT MAKE ANY OTHER CHANGES TO THE CODE BELOW!!!
        
        // MARK: START
        
       let firebaseAuth = Auth.auth()
        do{
            
            try firebaseAuth.signOut()
            
        } catch let signOutError as NSError {
            print("error signing out")
            
        }
        
       // MARK: END
        
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
