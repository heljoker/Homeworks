//
//  UsedDefaultsViewController.swift
//  1_14 homework
//
//  Created by Павел Замулин on 27.02.2022.
//

import UIKit

class UsedDefaultsViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextView!
    @IBOutlet var lastnameTextField: UITextView!
    
    @IBAction func recordButton(_ sender: Any) {
        PersistanceUD.shared.userName = nameTextField.text
        PersistanceUD.shared.userLastName = lastnameTextField.text
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = PersistanceUD.shared.userName
        lastnameTextField.text = PersistanceUD.shared.userLastName
    }

}
