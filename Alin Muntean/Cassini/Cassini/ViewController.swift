//
//  ViewController.swift
//  Cassini
//
//  Created by Alin Muntean on 03/03/15.
//  Copyright (c) 2015 Alin Muntean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let ivc = segue.destinationViewController as? ImageViewController {
            if let identifier = segue.identifier {
                switch identifier {
                    case "Earth":
                    ivc.imageURL = DemoURL.NASA.Earth
                    ivc.title = "Earth"
                    
                    case "Saturn":
                    ivc.imageURL = DemoURL.NASA.Saturn
                    ivc.title = "Saturn"
                    
                    case "Cassini":
                    ivc.imageURL = DemoURL.NASA.Cassini
                    ivc.title = "Cassini"
                    
                    default: break
                }
            }
        }
    }
}

