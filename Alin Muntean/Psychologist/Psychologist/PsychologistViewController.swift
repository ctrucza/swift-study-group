//
//  PsychologistViewController.swift
//  Psychologist
//
//  Created by Alin Muntean on 24/02/15.
//  Copyright (c) 2015 Alin Muntean. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {
    
    @IBAction func nothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destionation = segue.destinationViewController as? UIViewController
        if let navCon = destionation as? UINavigationController {
            destionation = navCon.visibleViewController
        }
        
        if let hvc = destionation as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                    case "sad": hvc.happiness = 0
                    case "happy": hvc.happiness = 100
                    case "nothing": hvc.happiness = 25
                    default: hvc.happiness = 50
                }
            }
        }
    }
}

