//
//  ViewController.swift
//  ObjectOrientedProgramming
//
//  Created by Wilbert xu on 15/05/19.
//  Copyright © 2019 AppleDeveloperAcademyBinus. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var coffeeLabel: UILabel!
    @IBOutlet weak var milkLabel: UILabel!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var coffeeMachine: CoffeeMachine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        coffeeMachine = CoffeeMachine(milk: 200, brand: "Cappucino")
//       print("jumlah beans: \(coffeeMachine.numOfBeans), jumlah milk: \(coffeeMachine.numOfMilk)")
        updateLabel()
        print(coffeeMachine.voltages)
        
        passwordTextField.delegate = self
    }

    @IBAction func addCoffee(_ sender: Any) {
        coffeeMachine.addBeans(beans: 100)
        updateLabel()
    }
    
    @IBAction func addMilk(_ sender: Any) {
        coffeeMachine.addMilk(milk: 20)
        updateLabel()
    }
    
    @IBAction func makeCoffee(_ sender: Any) {
        coffeeMachine.makeCoffee()
        updateLabel()
    }
    
    func updateLabel() {
      coffeeLabel.text = String(coffeeMachine.numOfBeans)
      milkLabel.text = String(coffeeMachine.numOfMilk)
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail", let destination = segue.destination as? DetailViewController {
            destination.nameFromPreviousView = firstNameTextField.text
        }
    }
    
}

extension ViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameTextField {
            if textField.text == "" {
                let alert = UIAlertController(title: "Error", message: "Text field should not be empty", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
            passwordTextField.becomeFirstResponder()
            }
        } else {
            passwordTextField.resignFirstResponder()
        }
        
        return true
    }
}

