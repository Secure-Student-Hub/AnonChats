//
//  LoginViewController.swift
//  AnonChats
//
//  Created by Subomi Popoola on 11/7/20.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        curveButtonEdges()
        didTapBackground()
    }
    
    func curveButtonEdges() {
        self.loginButton.layer.cornerRadius = 15
        self.loginButton.layer.borderWidth = 2
    }
    
    func loginUser() {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { (success, error) in
            if (success != nil) {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error description: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    @objc func backgroundTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        self.view.endEditing(true)
    }
    
    func didTapBackground() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action:                           #selector(backgroundTapped(tapGestureRecognizer:)))
        self.backgroundImage.addGestureRecognizer(tapGestureRecognizer)
        self.backgroundImage.isUserInteractionEnabled = true
    }
    
    @IBAction func didTapLogin(_ sender: Any) {
        loginUser()
    }
    
    @IBAction func didTapSignup(_ sender: Any) {
        self.performSegue(withIdentifier: "signupSegue", sender: nil)
    }
    
}
