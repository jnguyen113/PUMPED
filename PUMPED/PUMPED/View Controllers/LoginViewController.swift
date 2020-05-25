//
//  LoginViewController.swift
//  PUMPED
//
//  Created by Johnathan Nguyen on 5/19/20.
//  Copyright © 2020 Johnathan Nguyen. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class LoginViewController: UIViewController {
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
         //Do any additional setup after loading the view.

    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        checkUserInfo()
//    }

    @IBAction func loginTapped(_ sender: Any) {
            validateFields()
    }
    
    @IBAction func SignInGTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "google")
        vc?.modalPresentationStyle = .overFullScreen
        present(vc!, animated: true)
    }
    
 

    @IBAction func createAccountTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main" ,bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "signUp")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func validateFields() {
        if Email.text?.isEmpty == true {
            print("No Email Text")
            return
        }
        if Password.text?.isEmpty == true {
            print ("No Password")
            return
        }
        login()
    }
    
    func login() {
        Auth.auth().signIn(withEmail: Email.text!, password: Password.text!) { [weak self] authResult, err in
            guard let strongSelf = self else {return}
            if let err = err {
                print(err.localizedDescription)//so we know what error
            }
            self!.checkUserInfo()
        }
    }
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            let storyboard = UIStoryboard(name: "Main" ,bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "homePage")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        }
    }
    
    
}
