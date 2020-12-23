

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var errorTextfield: UILabel!
    
    @IBAction func loginPressed(_ sender: UIButton)
    {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text
        {
            
            
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let e = error
                {
                    print(e.localizedDescription)
                    self!.errorTextfield.text = "ERROR: \(e.localizedDescription)"
                }
                else
                {
//                    self?.performSegue(withIdentifier: K.loginSegue, sender: self)
//                    this can also be written
                    self?.performSegue(withIdentifier: "LoginToChat", sender: self)
                }
            }
        }
    }
    
}
