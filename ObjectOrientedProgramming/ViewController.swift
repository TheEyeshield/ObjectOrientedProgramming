//
//  ViewController.swift
//  ObjectOrientedProgramming
//
//  Created by Wilbert xu on 15/05/19.
//  Copyright © 2019 AppleDeveloperAcademyBinus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var coffeeLabel: UILabel!
    @IBOutlet weak var milkLabel: UILabel!
    
    var coffeeMachine: CoffeeMachine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        coffeeMachine = CoffeeMachine(milk: 200, brand: "Cappucino")
//       print("jumlah beans: \(coffeeMachine.numOfBeans), jumlah milk: \(coffeeMachine.numOfMilk)")
        updateLabel()
        print(coffeeMachine.voltages)
        
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
    
}

