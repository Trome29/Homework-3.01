//
//  ViewController.swift
//  Homework 3.01
//
//  Created by Roman on 01.11.2022.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {
    
    @IBOutlet var codeView: SpringTextView!
    @IBOutlet var runButton: SpringButton!
    
    private var isBall = false
    private var selectedForce = CGFloat.random(in: 0.5...1.5)
    private var selectedDuration = CGFloat.random(in: 1...2)
    private var selectedDelay: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runButton.setTitle("Run \(codeView.animation)", for: .normal)
    }
    
    private func changeBall() {
        isBall.toggle()
        let animation = CABasicAnimation()
        let halfWidth = codeView.frame.width / 2
        let cornerRadius: CGFloat = isBall ? halfWidth : 10
        animation.keyPath = "cornerRadius"
        animation.fromValue = isBall ? 10 : halfWidth
        animation.toValue = cornerRadius
        animation.duration = 0.2
        codeView.layer.cornerRadius = cornerRadius
        codeView.layer.add(animation, forKey: "radius")
    }
    
    @IBAction func shapeButtonPressed(_ sender: AnyObject) {
        changeBall()
    }
    @IBAction func runButtonPressed(_ sender: SpringButton) {
        
        //first animation
        codeView.animation = "squeezeDown"
        codeView.curve = "easeIn"
        codeView.force = selectedForce
        codeView.duration = selectedDuration
        codeView.delay = selectedDelay
        
        codeView.text += "\n\n\npreset: \"\(codeView.animation)\"\n"
        codeView.text += "curve: \"\(codeView.curve)\"\n"
        codeView.text += String(format: "force:  %.1f\n", Double(codeView.force))
        codeView.text += String(format: "duration:  %.1f\n", Double(codeView.duration))
        codeView.text += String(format: "delay:  %.1f\n", Double(codeView.delay))
        
        codeView.animate()
        
    }
}

