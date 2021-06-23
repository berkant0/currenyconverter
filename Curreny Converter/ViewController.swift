//
//  ViewController.swift
//  Curreny Converter
//
//  Created by Berkant Dağtekin on 23.06.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var kwdLabel: UILabel!
    @IBOutlet weak var bhdLabel: UILabel!
    @IBOutlet weak var omrLabel: UILabel!
    @IBOutlet weak var jodLabel: UILabel!
    @IBOutlet weak var gipLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var eurLabel: UILabel!
    @IBOutlet weak var kydLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    @IBAction func getButton(_ sender: Any) {
    
                   let url = URL(string: "http://data.fixer.io/api/latest?access_key=163b27c226745974b46fd2c09d6bb43a")
                   let session = URLSession.shared
                   
                   
                   let task = session.dataTask(with: url!) {(data, response, error) in
                   
                   if error != nil {
                       let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                       let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                       alert.addAction(okButton)
                       self.present(alert, animated: true, completion: nil)
                   } else {
                       
                       if data != nil {
                        
                           do{
                               let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String , Any>
                               
                               DispatchQueue.main.async {
                                   
                                   if let rates = jsonResponse["rates"] as? [String : Any] {
                                       
                                       if let kwd = rates["KWD"] as? Double {
                                           self.kwdLabel.text = "KWD: \(kwd)"
                                       }
                                       if let bhd = rates["BHD"] as? Double {
                                           self.bhdLabel.text = "BHD: \(bhd)"
                                       }
                                       if let omr = rates["OMR"] as? Double {
                                           self.omrLabel.text = "OMR: \(omr)"
                                       }
                                       if let jod = rates["JOD"] as? Double {
                                           self.jodLabel.text = "JOD: \(jod)"
                                       }
                                       if let gip = rates["GIP"] as? Double {
                                           self.gipLabel.text = "GIP: \(gip)"
                                       }
                                       if let gbp = rates["GBP"] as? Double {
                                           self.gbpLabel.text = "GBP: \(gbp)"
                                       }
                                       if let eur = rates["EUR"] as? Double {
                                           self.eurLabel.text = "EUR: \(eur)"
                                       }
                                       if let kyd = rates["KYD"] as? Double {
                                           self.kydLabel.text = "KYD: \(kyd)"
                                       }
                                       if let chf = rates["CHF"] as? Double {
                                           self.chfLabel.text = "CHF: \(chf)"
                                       }
                                       if let usd = rates["USD"] as? Double {
                                           self.usdLabel.text = "USD: \(usd)"
                                       }
                                   }
                               }
                               
                           }catch{
                               print("error")
                           }
                           
                       }
                   }
               }
               
               task.resume()
           }
    
}

