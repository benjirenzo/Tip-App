//
//  ViewController.swift
//  Tip App
//
//  Created by Benji Renzo Kuroda on 10/10/15.
//  Copyright © 2015 Benji Renzo Kuroda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet var totalPerPerson: UILabel!
    @IBOutlet var peopleLabel: UILabel!
    @IBOutlet var peopleStepper: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        totalPerPerson.text = "$0.00"
        peopleStepper.wraps = false
        peopleStepper.autorepeat = true
        peopleStepper.maximumValue = 10
        peopleLabel.text = ("1")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func stepperValueChanged(sender: UIStepper) {
        peopleLabel.text = Int(sender.value).description
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.20, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var peopleNumber = NSString(string: peopleLabel.text!).doubleValue
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        var totalPerson = total / peopleNumber
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        totalPerPerson.text = "$\(totalPerson)"
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        totalPerPerson.text = String(format: "$%.2f", totalPerson)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

