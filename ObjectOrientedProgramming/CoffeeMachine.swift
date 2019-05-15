//
//  CoffeeMachine.swift
//  ObjectOrientedProgramming
//
//  Created by Wilbert xu on 15/05/19.
//  Copyright © 2019 AppleDeveloperAcademyBinus. All rights reserved.
//

import Foundation

class CoffeeMachine : Machine {
    var numOfBeans: Int = 100
    var numOfMilk: Int
    var brand: String
    
    init(milk: Int, brand: String) {
        numOfMilk = milk
        self.brand = brand
    }
    
    func addMilk(milk: Int) {
        numOfMilk = numOfMilk + milk
    }
    
    func addBeans(beans: Int) {
        numOfBeans = numOfBeans + beans
    }
    
    func makeCoffee() {
        numOfBeans = numOfBeans - 2
        numOfMilk = numOfMilk - 1
    }
    
}
