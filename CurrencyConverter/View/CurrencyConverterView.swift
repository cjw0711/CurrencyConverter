//
//  CurrencyConverterView.swift
//  CurrencyConverter
//
//  Created by user232949 on 2/17/23.
//

import UIKit

class CurrencyConverterView: UIViewController {
    
    var currencyDictionary : Dictionary<String, Double> = [:]
    @IBOutlet weak var usd: UILabel!
    @IBOutlet weak var euro: UILabel!
    @IBOutlet weak var won: UILabel!
    @IBOutlet weak var yen: UILabel!
    @IBOutlet weak var yuan: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let labels = [ "usd" : usd,
                       "euro": euro,
                       "won": won,
                       "yen": yen,
                       "yuan": yuan]
        let currencyList = ["usd": " Amount USD: $",
                            "euro": " Euro- €",
                            "won": " Won- ₩",
                            "yen": " Yen- ¥",
                            "yuan": " Yuan- ¥"]
        for (key, value) in currencyDictionary {
            if (value > -1) {
                labels[key]!!.isHidden = false
                labels[key]!!.text = String(format: "\(currencyList[key]!)%.02f", value)
            } else {
                labels[key]!!.isHidden = true
            }
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
