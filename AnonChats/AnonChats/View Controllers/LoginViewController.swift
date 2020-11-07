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
    @IBOutlet weak var anonChatsLabel: UILabel!
    @IBOutlet weak var morganBearImage: UIImageView!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        curveButtonEdges()
        didTapBackground()
        setFrames()
    }
    
    func setFrames() {
        let viewFrame = self.view.frame
        
        self.anonChatsLabel.frame.origin.x = (viewFrame.size.width - self.anonChatsLabel.frame.size.width) / 2
        self.anonChatsLabel.frame.origin.y = (viewFrame.size.height * 0.1)
        
        self.morganBearImage.frame.size.width = (viewFrame.width * 0.58)
        self.morganBearImage.frame.size.height = (viewFrame.size.height * 0.181)
        self.morganBearImage.frame.origin.x = (viewFrame.size.width - self.morganBearImage.frame.size.width) / 2
        self.morganBearImage.frame.origin.y = (viewFrame.size.height * 0.25)
        
        self.usernameField.frame.origin.x = (viewFrame.size.width - self.usernameField.frame.size.width) / 2
        self.usernameField.frame.origin.y = (viewFrame.size.height * 0.528)
        
        self.passwordField.frame.origin.x = (viewFrame.size.width - self.passwordField.frame.size.width) / 2
        self.passwordField.frame.origin.y = (viewFrame.size.height * 0.654)
        
        self.loginButton.frame.size.height = (viewFrame.size.height * 0.0547)
        self.loginButton.frame.size.width = (viewFrame.size.width * 0.4)
        self.loginButton.frame.origin.x = (viewFrame.size.width - self.loginButton.frame.size.width) / 2
        self.loginButton.frame.origin.y = (viewFrame.size.height * 0.77)
        
        self.signUpButton.frame.origin.x = (viewFrame.size.width - self.signUpButton.frame.size.width) / 2
        self.signUpButton.frame.origin.y = (viewFrame.size.height * 0.89)
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
