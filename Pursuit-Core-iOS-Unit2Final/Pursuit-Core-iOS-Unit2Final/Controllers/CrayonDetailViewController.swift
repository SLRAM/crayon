//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Stephanie Ramirez on 12/3/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class CrayonDetailViewController: UIViewController {
    @IBOutlet weak var crayonName: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var resetButton: UIButton!
    
    public var crayon: Crayon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetColor(resetButton)
    }
    
    private func defaultValues() {
        redSlider.value = Float(crayon.red/255)
        greenSlider.value = Float(crayon.green/255)
        blueSlider.value = Float(crayon.blue/255)
        alphaStepper.value = 1
        updateLabels()
    }
    private func updateLabels() {
        redLabel.text = String(format: "%.1f", redSlider.value)
        greenLabel.text = String(format: "%.1f", greenSlider.value)
        blueLabel.text = String(format: "%.1f", blueSlider.value)
        alphaLabel.text = String(format: "%.1f", alphaStepper.value)
        
    }
    private func updateColor() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        let alpha = CGFloat(alphaStepper.value)
        let color = UIColor(displayP3Red: red, green: green, blue: blue, alpha: alpha)
        view.backgroundColor = color
        updateLabels()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        updateColor()
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        updateColor()
    }
    
    @IBAction func resetColor(_ sender: UIButton) {
        view.backgroundColor = crayon.color()
        defaultValues()
    }
    
}
