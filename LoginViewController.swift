//
//  ViewController.swift
//  StudentPortal
//
//  Created by IACD-026 on 2022/07/09.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var studentLogoUIImageView: UIImageView!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
  
    @IBOutlet weak var enterEmailTextField: UITextField!
    
    @IBOutlet weak var enterPasswordTextField: UITextField!
    
    
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    @IBOutlet weak var submitButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //enterEmailTextField.delegate = self
        //enterPasswordTextField.delegate = self
    }
    
    /*func textFieldShouldReturn(_ textfield: UITextField) -> Bool {
        self.enterEmailTextField.resignFirstResponder()
        self.enterPasswordTextField.resignFirstResponder()
        return true
    
    }*/
    
    
    //The function below checks if the user has entered enough characters inside the text fields.  The text field changes background colour if the there isn't enough characters (Less than 5)
    
    func checkInput () -> Bool {
        
        //1.checking characters in the email field
        if ((enterEmailTextField.text?.count)! < 5 ){
            
            enterEmailTextField.backgroundColor = UIColor.init(red: 0.8, green: 0, blue: 0, alpha: 0.2)
            return false
            
        }else {
            
            enterEmailTextField.backgroundColor = UIColor.white
            
        }
        
        //2. checking characters in the password field
        if ((enterPasswordTextField.text?.count)! < 5 ){
            
            enterPasswordTextField.backgroundColor = UIColor.init(red: 0.8, green: 0, blue: 0, alpha: 0.2)
            return false
            
        }else {
            
            enterPasswordTextField.backgroundColor = UIColor.white
            
        }
        
        return true
    }
    

    @IBAction func SubmitButton(_ sender: Any) {
        
        //1.Check if the user has put enough characters inside the password field
        if (!checkInput()){
            return
        }
        
        let email = enterEmailTextField.text
        
        let password = enterPasswordTextField.text
        
        //The code below fires the Login function
        
        Auth.auth().signIn(withEmail: email!, password: password!, completion: {
            (user, error) in
            
            if let error = error {
                
                Utilities().ShowAlert(title: "Error!", message: error.localizedDescription, vc: self)
                print(error.localizedDescription)
                return
            }
            
            
                print("Signed in")
                
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabBarCon  = storyboard.instantiateViewController(withIdentifier: "tabBarController")
            self.present(tabBarCon, animated: true, completion: nil)
            
        

            
            
            
        })
        
        
    }
    
    
    @IBAction func forgotPasswordClicked(_ sender: Any) {
        
        //This sends an alert if the email text field has no input
        if(enterEmailTextField.text?.isEmpty == true){
            
         Utilities().ShowAlert(title: "Error", message: "Please enter your student email", vc: self)
        }
           
            
        
       
        
        if  (!enterEmailTextField.text!.isEmpty){
            
            let email = self.enterEmailTextField.text
            
            // This checks if the student email address entered exists on the databse
            Auth.auth().sendPasswordReset(withEmail: email!, completion: { (error) in
                if let error = error {
                // Sends and error alert if the email is badly formatted or the  student email does not exist
                    Utilities().ShowAlert(title: "Error", message: error.localizedDescription, vc: self)
                    
                    return
                }
                // Sends a confirmation alert if the password reset was successful
                Utilities().ShowAlert(title: "Success!", message: "Please check your email", vc: self)
            })
        }
    }
    
}

