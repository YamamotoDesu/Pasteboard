//
//  ViewController.swift
//  Pasteboard
//
//  Created by Nyisztor, Karoly on 8/6/18.
//  Copyright © 2018 Nyisztor, Karoly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    lazy var keychain = KeychainFacade()
    
    @IBAction func onSaveCredentials(_ sender: Any) {
        if let username = usernameField.text,
            let password = passwordField.text {
//            UserDefaults.standard.set(username, forKey: "username")
//            UserDefaults.standard.set(password, forKey: "password")
            do {
                try keychain.set(string: username, forKey: "username")
                try keychain.set(string: password, forKey: "password")
            } catch let facadeError as KeychainFacadeError {
                print("Could not store credentials in the keychain \(facadeError)")
            } catch {
                print(error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let username = try? keychain.string(forKey: "username"),
              let password = try? keychain.string(forKey: "password") else {
            print("Could not retrieve credentials from the keychain")
            return
        }
        
        usernameField.text = username
        passwordField.text = password
        // Do any additional setup after loading the view, typically from a nib.
//        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIApplicationWillResignActive, object: nil, queue: OperationQueue.main) { _ in
//            for view in self.view.subviews {
//                if let textField = view as? UITextField {
//                    textField.text = nil
//                }
//            }
//        }
        
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        NotificationCenter.default.removeObserver(self)
//        super.viewDidDisappear(animated)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

