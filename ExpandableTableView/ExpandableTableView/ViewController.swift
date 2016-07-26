//
//  ViewController.swift
//  ExpandableTableView
//
//  Created by Soubhi Hadri on 26/07/16.
//  Copyright © 2016 Soubhi Hadri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: "goToExpandableTableView", userInfo: nil, repeats: false)

        
    }
    
    func goToExpandableTableView() {
        let expandableTable:ExpandableTableViewViewController=ExpandableTableViewViewController();
        
        self.presentViewController(expandableTable, animated: true, completion: nil);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

