//
//  ViewController.swift
//  ColorClock
//
//  Created by James on 1/24/16.
//  Copyright © 2016 James Risberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateClock()
        _ = NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector:Selector("updateClock"), userInfo:nil, repeats:true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateClock() {
        let time = NSDate()
        let calendar = NSCalendar.currentCalendar()
        
        let dateComponents = calendar.components([NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second], fromDate: time)
        
        let hours = (dateComponents.hour > 9) ? "\(dateComponents.hour)" : "0\(dateComponents.hour)"
        let minutes = (dateComponents.minute > 9) ? "\(dateComponents.minute)" : "0\(dateComponents.minute)"
        let seconds = (dateComponents.second > 9) ? "\(dateComponents.second)" : "0\(dateComponents.second)"
        
        clockLabel.text = "#\(hours)\(minutes)\(seconds)"
        
        UIView.animateWithDuration(0.3) { () -> Void in
            self.view.backgroundColor = colorWithHexString(self.clockLabel.text!)
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

