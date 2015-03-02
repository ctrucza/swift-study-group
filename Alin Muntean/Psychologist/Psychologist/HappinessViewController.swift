//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Alin Muntean on 14/02/15.
//  Copyright (c) 2015 Alin Muntean. All rights reserved.
//

import UIKit


class HappinessViewController: UIViewController, FaceViewDataSource {
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
        }
    }
    
    var happiness: Int = 25 { // 0 = very sad, 100 = ecstatic
        didSet {
            happiness = min(max(happiness, 0), 100)
            println("happiness = \(happiness)")
            updateUI()
        }
    }
    
    private struct Constants {
        static let HappinessGestureScale: CGFloat = 4
    }
    
    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChange = -Int(translation.y / Constants.HappinessGestureScale)
            if happinessChange != 0 {
                happiness += happinessChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default:
            break
        }
    }
    
    private func updateUI() {
        faceView?.setNeedsDisplay()
        title = "\(happiness)"
    }
    
    
    // MARK: - FaceViewDataSource
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness-50)/50
    }

}
