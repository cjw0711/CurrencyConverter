//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by user232949 on 2/17/23.
//

import UIKit

class ViewController: UIViewController {
    
    var currencyLogic = CurrencyLogic()
    var currencyDictionary : Dictionary<String, Double> = [:]
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    enum errorAmount: Error {
        case negativeAmount
        case notAnInt
    }
    @IBAction func euroSwitch(_ sender: UISwitch) {
        currencyLogic.setEuro(sender.isOn)
    }
    @IBAction func yenSwitch(_ sender: UISwitch) {
        currencyLogic.setYen(sender.isOn)
    }
    @IBAction func yuanSwitch(_ sender: UISwitch) {
        currencyLogic.setYuan(sender.isOn)
    }
    @IBAction func wonSwitch(_ sender: UISwitch) {
        currencyLogic.setWon(sender.isOn)
    }
    @IBAction func doConversion(_ sender: UIButton) {
        errorMessage.text = "" 
        do {
            let USD = try errorCheck()
            currencyLogic.setUSD(USD)
            currencyDictionary = currencyLogic.converter()
            self.performSegue(withIdentifier: "convertUSD", sender: self)
        } catch {
            errorMessage.text = "ERROR! Enter a positive number."
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "convertUSD" {
            let navigation = segue.destination as! CurrencyConverterView
            navigation.currencyDictionary = currencyDictionary
        }
    }
    func errorCheck() throws -> Int {
        guard let usd = Int(input.text!) else {
            throw errorAmount.notAnInt
        }
        guard usd > -1 else {
            throw errorAmount.negativeAmount
        }
        return usd
    }
    
}

