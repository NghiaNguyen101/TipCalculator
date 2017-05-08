//
//  ViewController.swift
//  TipCalculator
//
//  Created by Nghia Nguyen on 5/4/17.
//  Copyright © 2017 Nghia Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, SetDefaultTipPercentage {

    @IBOutlet weak var partySlider: UISlider!
    @IBOutlet weak var billEachLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var tipBillLabel: UILabel!
    @IBOutlet weak var tipPercentSegment: UISegmentedControl!
    
    let tipPercentage = [0.1, 0.15, 0.2]
    var defaultTipIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.partySlider.value = 1
        let userDefault = UserDefaults.standard
       
        defaultTipIndex = userDefault.integer(forKey: "defaultP")
        self.tipPercentSegment.selectedSegmentIndex = defaultTipIndex
        self.billTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setDefaultTipPercentage(index: Int) {
        print("here")
        defaultTipIndex = index
        tipPercentSegment.selectedSegmentIndex = index
        billOnChange((Any).self)
        let userDefault = UserDefaults.standard
        userDefault.set(index, forKey: "defaultP")
    }

    @IBAction func onTapScreen(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func billOnChange(_ sender: Any) {
        let p = tipPercentage[ tipPercentSegment.selectedSegmentIndex]
        let bill = Double(billTextField.text!) ?? 0
        let tip = bill * p
        let total = bill + tip
        tipBillLabel.text = String(format: "$%4.2f", tip)
        totalBillLabel.text = String(format: "$%4.2f", total)
        let partyNumber = floor( Double(partySlider.value))
        let each = total / partyNumber
        billEachLabel.text = String.init(format: "$%4.2f", each)
        partyLabel.text = String(format: "Party: %d", Int(partyNumber))    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("sub")
        let destVC =  segue.destination as! SettingViewController
        destVC.defaultIndex = defaultTipIndex
        destVC.defaultTipDelegate = self

    }
}

