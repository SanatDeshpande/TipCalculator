//
//  SettingsController.swift
//  TipCalculator
//
//  Created by Sanat Deshpande on 1/5/17.
//  Copyright © 2017 Sanat Deshpande. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    @IBOutlet weak var amount1: UITextField!
    @IBOutlet weak var amount2: UITextField!
    @IBOutlet weak var amount3: UITextField!
    
    var parentView: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        amount1.text = String(format: "%.0f", parentView.percentages[0] * 100)
        amount2.text = String(format: "%.0f", parentView.percentages[1] * 100)
        amount3.text = String(format: "%.0f", parentView.percentages[2] * 100)
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeAmountOne(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let amt = (Double(amount1.text!) ?? 0.0)/100
        defaults.setDouble(amt, forKey: "amountOne")
        parentView.percentages[0] = amt
        parentView.loadView()
        parentView.viewDidLoad()
    }
   
    @IBAction func changeAmountTwo(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let amt = (Double(amount2.text!) ?? 0.0)/100
        defaults.setDouble(amt, forKey: "amountTwo")
        parentView.percentages[1] = amt
        parentView.loadView()
        parentView.viewDidLoad()

    }
    
    @IBAction func changeAmountThree(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let amt = (Double(amount3.text!) ?? 0.0)/100
        defaults.setDouble(amt, forKey: "amountThree")
        parentView.percentages[2] = amt
        parentView.loadView()
        parentView.viewDidLoad()
    }
    
    
}
