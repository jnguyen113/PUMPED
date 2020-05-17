//
//  ViewController.swift
//  PUMPED
//
//  Created by Johnathan Nguyen on 5/17/20.
//  Copyright © 2020 Johnathan Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var presentValue = 0

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view. 
        //TESTING
    }

    @IBAction func onClick(_ sender: UIButton) {

            
        presentValue = presentValue+1
        label.text = "\(presentValue)"
//        let currLabelText = label.text;
//
//        if(currLabelText == "You just click the button"){
//            label.text = "You just click the button again.";
//        }else{
//            label.text = "You just click the button."
//        }
        label.sizeToFit();
    }
    

    
}
    


