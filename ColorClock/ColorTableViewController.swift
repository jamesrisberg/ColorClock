//
//  ColorTableViewController.swift
//  ColorClock
//
//  Created by James on 1/24/16.
//  Copyright © 2016 James Risberg. All rights reserved.
//

import UIKit

class ColorTableViewController: UIViewController {
    @IBOutlet var table: UITableView!
    @IBOutlet var newColorzButton: UIButton!
    @IBOutlet var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newColorz() {
        table.reloadData()
    }
    
    @IBAction func dismissColorz() {
        self.dismissViewControllerAnimated(true) { () -> Void in }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ColorCell", forIndexPath: indexPath) as! ColorCell
        
        var color = "#"
        for _ in 1...3 {
            color += String(format:"%2X", Int(arc4random_uniform(255) + 1))
        }
        
        cell.colorLabel.text = color;
        cell.backgroundColor = colorWithHexString(color)
        
        return cell
    }

}
