//
//  ViewController.swift
//  10s Challenge Ver.1.0
//
//  Created by Ryosei Tanaka on 2018/08/07.
//  Copyright © 2018年 Ryosei Tanaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var label: UILabel!
    
    var count: Float = 0.0000
    
    var timer: Timer = Timer()
    @IBOutlet var hanteiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func up(){
        count = count + 0.0111
        label.text = String(format:"%.4f",count)
    }
    
    @IBAction func reset(){
        if timer.isValid{
            timer.invalidate()
        }
        count = 0.000
        
        label.text = String(format: "%.4f",count)
    }
    @IBAction func start(){
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.0100,
                                         target:self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats:true)
        }
hanteiLabel.text = ""
    }
    
    
    @IBAction func stop(){
        if timer.isValid {
            timer.invalidate()
            if count > 9.9962 && count < 10.001{
                hanteiLabel.text = "CRITICAL!!!!"
            }
            else if count > 9.9921 && count < 10.0075{
                hanteiLabel.text = "PERFECT!"
            }
            else if count > 9.89 && count < 10.21{
                hanteiLabel.text = "GREAT!"
            }
            else if count > 9.59 && count < 10.51{
                hanteiLabel.text = "GOOD!"
            }else{
                hanteiLabel.text = "BAD..."
            }
            
            }
        }
        
    }

