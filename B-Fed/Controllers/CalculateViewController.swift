//
//  ViewController.swift
//  B-Fed
//
//  Created by Jody Clelland on 18/1/21.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var weightValue = "0.0"
    
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var weightSlider: UISlider!
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.1f", sender.value)
        weightLabel.text = "\(weight)lbs"
    }


    @IBAction func calculateButtonPressed(_ sender: UIButton) {
    
        let weight = weightSlider.value
        
        let feeds = weight * 2.5
        weightValue = String(format: "%.f", feeds)
        
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.weightValue = weightValue
        }
    }
    
}


