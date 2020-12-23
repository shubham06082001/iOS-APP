

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var errorTextfield: UILabel!
    @IBAction func registerPressed(_ sender: UIButton)
    {
        if let email = emailTextfield.text, let password = passwordTextfield.text
        {
            
            Auth.auth().createUser(withEmail: email, password: password)
            {
                authResult, error in
                // ...
                if let e = error
                {
                    print(e.localizedDescription)
                    self.errorTextfield.text = "ERROR: \(e.localizedDescription)"
                }
                else
                {
                    //navigate to chat view controller
//                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
//                    this can also be written
                   self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                }
            }
        }
    }
    
}
