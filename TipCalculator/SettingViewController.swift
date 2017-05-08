//
//  SettingViewController.swift
//  TipCalculator
//
//  Created by Nghia Nguyen on 5/4/17.
//  Copyright © 2017 Nghia Nguyen. All rights reserved.
//

import UIKit

protocol SetDefaultTipPercentage : class {
    func setDefaultTipPercentage(index: Int)
}

class SettingViewController: UIViewController {

    @IBOutlet weak var settingTipSegment: UISegmentedControl!
    
    var defaultIndex = 0
    weak var defaultTipDelegate:SetDefaultTipPercentage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        settingTipSegment.selectedSegmentIndex = defaultIndex
        
        
    }

    @IBAction func defaultTipChange(_ sender: Any) {
        print("wow")
        defaultTipDelegate?.setDefaultTipPercentage(index: settingTipSegment.selectedSegmentIndex)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("what???")
    }
     */

}
