//
//  SignUpViewController.swift
//  PUMPED
//
//  Created by Johnathan Nguyen on 5/19/20.
//  Copyright © 2020 Johnathan Nguyen. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import GoogleSignIn

class SignUpViewController: UIViewController {

    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func SignUpTap(_ sender: Any) {
        if Email.text?.isEmpty == true {
                print("No text in email field")
                return
        }
        if Password.text?.isEmpty == true {
                print("No text in password field")
                return
        }
        signUP()
    }
    

    
    @IBAction func alreadyHaveAccountTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Login")
        vc?.modalPresentationStyle = .overFullScreen
        present(vc!, animated: true)
    }
    
    func signUP(){
        Auth.auth().createUser(withEmail: Email.text!, password: Password.text!) {
            (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("Error \(error?.localizedDescription)")
                return
            }
            
            guard let email = self.Email.text, let password = self.Password.text else {
                return
            }
           
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "homePage")
            vc?.modalPresentationStyle = .overFullScreen
            self.present(vc!, animated: true)
            
            let ref = Database.database().reference(fromURL: "https://pumped-87951.firebaseio.com/")
            let values = ["email": email, "password": password]
            //User authenticated
            ref.updateChildValues(values, withCompletionBlock: { (error, ref)
                in
                if error != nil {
                    print(error)
                    return
                }
                print("Saved user successfully")
            })
        }
    }
//    @IBAction func signUP(_ sender: Any) {
//        Auth.auth().createUser(withEmail: Email.text!, password: Password.text!) { (authResult, error) in
//                guard let user = authResult?.user, error == nil else{
//                    print("Error \(error?.localizedDescription)")
//                    return
//                }
//                let sb = UIStoryboard(name: "Main", bundle: nil)
//                let vc = self.storyboard?.instantiateViewController(withIdentifier: "mainHome")
//                vc?.modalPresentationStyle = .overFullScreen
//                self.present(vc!, animated: true)
//        }
//    }
}
