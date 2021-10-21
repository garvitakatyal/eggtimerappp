//
//  ViewController.swift
//  eggtimerapp
//
//  Created by Garvita Katyal on 10/20/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!

    var eggTimes = ["Hard" : 10, "Medium" : 7, "Soft" : 4] //Dictionary.
    
    var startTime = 0
    var totalTime = 0
    var timer = Timer()
    
    @IBAction func clickMe(_ sender: UIButton) {
        //who.what = value
        
        timer.invalidate() //these 3 lines are for multiple use of the app.
        
        progressView.progress = 0.0
        startTime = 0
        let hardness = sender.currentTitle!
        //output of hardness is hard so the input should be 10 sec.
        print(hardness)
        outputLabel.text = hardness
        totalTime = eggTimes[hardness]! //10 or 7 or 4.
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounter() {
       
            if startTime < totalTime  {
                
               
                startTime += 1
                progressView.progress = Float(startTime)/Float(totalTime)
                
            }
            
            else {
                
                outputLabel.text = "Eggs are ready!"
                timer.invalidate()
            }
}
}




