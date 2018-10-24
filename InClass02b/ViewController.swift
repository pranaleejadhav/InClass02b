//
//  File Name. : ViewController.swift
//  Assignment : InClass02b
//  Student Full Name : Pranalee Jadhav
//  Created by Pranalee Jadhav on 10/24/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import UIKit
extension String {
    func isFloat() -> Bool {
        
        if let floatValue = Float(self) {
            
            if floatValue >= 0 {
                return true
            }
        }
        
        return false
    }
    
    
    var floatValue: Float {
        if self.isFloat() {
            return Float(self)!
        }
        else {
            return 0
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var fnumber: UITextField!
    @IBOutlet weak var snumber: UITextField!
    @IBOutlet weak var resultLb: UILabel!
    var selectedOp = "+"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func clearOp(_ sender: Any) {
        resultLb.text = "Result : 0.00"
        fnumber.text = ""
        snumber.text = ""
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            selectedOp = "+"
            break;
        case 1:
            selectedOp = "-"
            break;
        case 2:
            selectedOp = "*"
            break
        case 3:
            selectedOp = "/"
            break
            
        default:
            break;
        }
    }
    
    
    @IBAction func calcNumbers(_ sender: Any) {
        if selectedOp == "" {
            showMsg(title: "", subTitle: "Select Operation!")
        } else {
            performOp()
        }
    }
    

    func performOp(){
        let first = fnumber.text?.trimmingCharacters(in: .whitespaces)
        if first == ""{
            showMsg(title: "Error", subTitle: "First number cannot be empty")
        } else if !((first?.isFloat())!){
            showMsg(title: "Error", subTitle: "Invalid first number")
        }
        
        let second = snumber.text?.trimmingCharacters(in: .whitespaces)
        if second == ""{
            showMsg(title: "Error", subTitle: "Second number cannot be empty")
        } else if !((second?.isFloat())!){
            showMsg(title: "Error", subTitle: "Invalid second number")
        } else if (second?.floatValue == 0.0){
            showMsg(title: "Error", subTitle: "Second number cannot be zero")
        }
        
        switch selectedOp {
        case "+":
            resultLb.text = "Result : " + String((first?.floatValue)! + (second?.floatValue)!)
            break
        case "-":
            resultLb.text = "Result : " + String((first?.floatValue)! - (second?.floatValue)!)
            break
        case "*":
            resultLb.text = "Result : " + String((first?.floatValue)! * (second?.floatValue)!)
            break
        case "/":
            resultLb.text = "Result : " + String((first?.floatValue)! / (second?.floatValue)!)
            break
        
        default:
            break
        }
        
    }
    
    
    
    
    func showMsg(title: String, subTitle: String) -> Void {
        DispatchQueue.main.async(execute: {
            let alertController = UIAlertController(title: title, message: subTitle, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        })
    }

}

