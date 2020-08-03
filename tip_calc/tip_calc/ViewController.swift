//
//  ViewController.swift
//  tip_calc
//
//  Created by Jorge Garcia on 7/27/20.
//  Copyright © 2020 Jorge Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // text label
    @IBOutlet weak var tipLabel: UILabel!
    // text label
    @IBOutlet weak var totalLabel: UILabel!
    // a box to enter text
    @IBOutlet weak var billField: UITextField!
    //scroll button chooser
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        //print("Hello")
        
        //dismiss keyboard
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get the bill ammount
        // let is a constant declaration
        let bill = Double(billField.text!) ?? 0
        
        
        // Calculate the tip and total
        // Swift array accessed like a c array
        let tipPercentages = [0.10, 0.15, 0.18, 0.20]
        // tipControl (as declared above) is the name of the SegmentedControl view
        // when you select value change on the tipControl view box, accessing the
        // selectedSegmentIndex gives you the index number which then gets the value from tipP
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        
//        //------
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
//        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current
//
//        // We'll force unwrap with the !, if you've got defined data you may need more error checking
        let tipFormatted = currencyFormatter.string(from: NSNumber(value: tip))!
        let totalFormatted = currencyFormatter.string(from: NSNumber(value: total))!
//          print(tipFormatted) // Displays tip in the US locale
//        //-----
        
        // Update the tip and total labels
        //tipLabel.text = "$\(tip)"
//        tipLabel.text = String(format: "$%.2f", tip)
        tipLabel.text = tipFormatted
        //totalLabel.text =  "$\(total)"
//        totalLabel.text = String(format: "$%.2f", total)
        totalLabel.text = totalFormatted
    }
}

