//
//  ViewController.swift
//  TipCalculator
//
//  Created by Sanat Deshpande on 1/5/17.
//  Copyright © 2017 Sanat Deshpande. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var tipSelection: UISegmentedControl!
    var percentages = [0.15,0.2,0.25]
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "settingsSegue"){
            let dest = segue.destinationViewController as! SettingsController
            dest.parentView = self //as! ViewController
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<3{
            var s = String(format: "%.0f", percentages[i] * 100)
            s += "%"
            tipSelection.setTitle(s, forSegmentAtIndex: i)
        }
        
        //let defaults = NSUserDefaults.standardUserDefaults()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject){
        view.endEditing(true)
    }
   
    @IBAction func calculateTip(sender: AnyObject) {
        let bill = Double(billAmount.text!) ?? 0
        
        let tip = bill * percentages[tipSelection.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmount.text = String(format: "$%.2f", tip)
        totalAmount.text = String(format: "$%.2f", total)
        
    }
    
}

