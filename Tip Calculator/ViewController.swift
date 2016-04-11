//
//  ViewController.swift
//  Tip Calculator
//
//  Created by James Moulton on 8/31/15.
//  Copyright (c) 2015 Lava Flow Mobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //User enters meal cost and tip percent
    @IBOutlet weak var txtMeal: UITextField!
    @IBOutlet weak var txtTipPercent: UITextField!
    
    //Tip converts to $$ and total amt shown
    @IBOutlet weak var lblTipAmt: UILabel!
    @IBOutlet weak var lblFinalTotal: UILabel!
    
    var mealAmt = ""
    var tipPct = ""
    var totalTip : Float = 0.0
    var totalMealCost : Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    //The Calculate Button
    @IBAction func btnCalculate(sender: UIButton) {
       calculateTip()
     
    }

    //The Clear Button
    @IBAction func btnClear(sender: UIButton) {
        clearBox()
    }
    
    func calculateTip() {
        mealAmt = txtMeal.text!
        tipPct = txtTipPercent.text!
        
        let mealAmtConversion = (mealAmt as NSString).floatValue
        let tipPctConversion = (tipPct as NSString).floatValue
        totalTip = mealAmtConversion * (tipPctConversion / 100)
        totalMealCost = mealAmtConversion + totalTip
        printTip()
        hideKeyboards()
        
    }
    
    func printTip(){
        //Needed to format to two decimal places
        let formatTip = String(format: "%0.2f", totalTip)
        let formatTotal = String(format: "%0.2f", totalMealCost)
        
        //Takes two decimal format and places in label area
        lblTipAmt.text = "Tip: $\(formatTip)"
        lblFinalTotal.text = "$\(formatTotal)"
    }
    
    func clearBox(){
        txtMeal.text = ""
        txtTipPercent.text = ""
        lblTipAmt.text = "Tip: $0.00"
        lblFinalTotal.text = "$0.00"
        hideKeyboards()
        
    }
    
    //built in func that tells keyboard to hide when user touches off
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        hideKeyboards()
    }
    
    //func to make keyboard hide at correct time
    func hideKeyboards(){
        txtMeal.resignFirstResponder()
        txtTipPercent.resignFirstResponder()
        
    }
}

