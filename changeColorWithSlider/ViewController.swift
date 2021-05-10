//
//  ViewController.swift
//  changeColorWithSlider
//
//  Created by Lai Po Ying on 2021/5/7.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var deerImageView: UIImageView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var gradientSwitch: UISwitch!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var gradientLocationSlider: UISlider!
    @IBOutlet weak var leftGradientImageView: UIImageView!
    @IBOutlet weak var rightGradientImageView: UIImageView!
    @IBOutlet weak var leftGradientRedSlider: UISlider!
    @IBOutlet weak var leftGradientGreenSlider: UISlider!
    @IBOutlet weak var leftGradientBlueSlider: UISlider!
    @IBOutlet weak var leftGradientAlphaSlider: UISlider!
    @IBOutlet weak var rightGradientRedSlider: UISlider!
    @IBOutlet weak var rightGradientGreenSlider: UISlider!
    @IBOutlet weak var rightGradientBlueSlider: UISlider!
    @IBOutlet weak var rightGradientAlphaSlider: UISlider!
    
    
    let gradientLayer = CAGradientLayer()
    
    func syncSingleColorSliderValue() {
        backgroundImageView.backgroundColor = UIColor.init(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: CGFloat(alphaSlider.value)/255)
    }
    func syncGradientSliderValue() {
        
        leftGradientImageView.backgroundColor = UIColor.init(red: CGFloat(leftGradientRedSlider.value)/255, green: CGFloat(leftGradientGreenSlider.value)/255, blue: CGFloat(leftGradientBlueSlider.value)/255, alpha: CGFloat(leftGradientAlphaSlider.value)/255)
        rightGradientImageView.backgroundColor = UIColor.init(red: CGFloat(rightGradientRedSlider.value)/255, green: CGFloat(rightGradientGreenSlider.value)/255, blue: CGFloat(rightGradientBlueSlider.value)/255, alpha: CGFloat(rightGradientBlueSlider.value)/255)
        gradientLayer.colors = [UIColor.init(red: CGFloat(rightGradientRedSlider.value/255), green: CGFloat(rightGradientGreenSlider.value/255), blue: CGFloat(rightGradientBlueSlider.value/255), alpha: CGFloat(rightGradientAlphaSlider.value/255)).cgColor, UIColor.init(red: CGFloat(leftGradientRedSlider.value/255), green: CGFloat(leftGradientGreenSlider.value/255), blue: CGFloat(leftGradientBlueSlider.value/255), alpha: CGFloat(leftGradientAlphaSlider.value/255)).cgColor]
        gradientLayer.locations = [0.25, NSNumber(value: gradientLocationSlider.value)]
    }

    func showTurnOffGradientAlert() {
        let alert = UIAlertController(title: "Soft remind", message: "You should turn off gradient function before using single RGB slider or single RGB random button.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    func showTurnOnGradientAlert() {
        let alert = UIAlertController(title: "Soft remind", message: "You should turn on gradient function before using gradient RGB slider or gradient RGB random button.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientLayer.frame = deerImageView.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor]
        backgroundImageView.layer.addSublayer(gradientLayer)
        leftGradientImageView.layer.borderWidth = 1
        rightGradientImageView.layer.borderWidth = 1
        gradientLocationSlider.isEnabled = false
        leftGradientRedSlider.isEnabled = false
        leftGradientGreenSlider.isEnabled = false
        leftGradientBlueSlider.isEnabled = false
        leftGradientAlphaSlider.isEnabled = false
        rightGradientRedSlider.isEnabled = false
        rightGradientGreenSlider.isEnabled = false
        rightGradientBlueSlider.isEnabled = false
        rightGradientAlphaSlider.isEnabled = false
        redSlider.value = 255
        greenSlider.value = 0
        blueSlider.value = 0
        alphaSlider.value = 120
        syncSingleColorSliderValue()
    }
    
    
    
    
    
    @IBAction func redSliderValueChange(_ sender: Any) {
        if gradientSwitch.isOn {
            showTurnOffGradientAlert()
        }
        else{
            syncSingleColorSliderValue()
        }
    }
    @IBAction func greenSliderValueChange(_ sender: Any) {
        if gradientSwitch.isOn {
            showTurnOffGradientAlert()
        }
        else {
            syncSingleColorSliderValue()
        }
    }
    @IBAction func blueSliderValueChange(_ sender: Any) {
        if gradientSwitch.isOn {
            showTurnOffGradientAlert()
        }
        else {
            syncSingleColorSliderValue()
        }
    }
    @IBAction func alphaSliderValueChange(_ sender: Any) {
        if gradientSwitch.isOn {
            showTurnOffGradientAlert()
        }
        else {
            syncSingleColorSliderValue()
        }
    }
    @IBAction func randomChange(_ sender: Any) {
        if gradientSwitch.isOn {
            showTurnOffGradientAlert()
        }
        else {
        redSlider.value = Float(Int.random(in: 1...255))
        greenSlider.value = Float(Int.random(in: 1...255))
        blueSlider.value = Float(Int.random(in: 1...255))
        alphaSlider.value = Float(Int.random(in: 1...255))
        syncSingleColorSliderValue()
        }
    }
    @IBAction func switchChange(_ sender: Any) {
        if gradientSwitch.isOn {
            //將上方單一顏色的slider.value歸零
            redSlider.value = 0
            redSlider.isEnabled = false
            greenSlider.value = 0
            greenSlider.isEnabled = false
            blueSlider.value = 0
            blueSlider.isEnabled = false
            alphaSlider.value = 0
            alphaSlider.isEnabled = false
            //將gradientLocationSlider預設為中間值
            gradientLocationSlider.value = 0.925
            gradientLocationSlider.isEnabled = true
            //將gradientSilder調整成預設紅藍漸層
            leftGradientRedSlider.value = 255
            leftGradientRedSlider.isEnabled = true
            leftGradientGreenSlider.value = 0
            leftGradientGreenSlider.isEnabled = true
            leftGradientBlueSlider.value = 0
            leftGradientBlueSlider.isEnabled = true
            leftGradientAlphaSlider.value = 255
            leftGradientAlphaSlider.isEnabled = true
            rightGradientRedSlider.value = 0
            rightGradientRedSlider.isEnabled = true
            rightGradientGreenSlider.value = 0
            rightGradientGreenSlider.isEnabled = true
            rightGradientBlueSlider.value = 255
            rightGradientBlueSlider.isEnabled = true
            rightGradientAlphaSlider.value = 255
            rightGradientAlphaSlider.isEnabled = true
            syncGradientSliderValue()
            //將backgroundImageView的背景顏色變成透明
            backgroundImageView.backgroundColor = UIColor.clear
        }
        else {
            //將gradientLayer變回透明
            gradientLayer.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor]
            //將下方gradient相關Slider.value歸零
            gradientLocationSlider.value = 0
            leftGradientRedSlider.value = 0
            leftGradientGreenSlider.value = 0
            leftGradientBlueSlider.value = 0
            leftGradientAlphaSlider.value = 0
            rightGradientRedSlider.value = 0
            rightGradientGreenSlider.value = 0
            rightGradientBlueSlider.value = 0
            rightGradientAlphaSlider.value = 0
            gradientLocationSlider.isEnabled = false
            leftGradientRedSlider.isEnabled = false
            leftGradientGreenSlider.isEnabled = false
            leftGradientBlueSlider.isEnabled = false
            leftGradientAlphaSlider.isEnabled = false
            rightGradientRedSlider.isEnabled = false
            rightGradientGreenSlider.isEnabled = false
            rightGradientBlueSlider.isEnabled = false
            rightGradientAlphaSlider.isEnabled = false
            //將上方 slider 調整為預設紅鹿
            redSlider.value = 255
            greenSlider.value = 0
            blueSlider.value = 0
            alphaSlider.value = 120
            redSlider.isEnabled = true
            greenSlider.isEnabled = true
            blueSlider.isEnabled = true
            alphaSlider.isEnabled = true
            syncSingleColorSliderValue()
            //將左右gradient預覽的imageview變回白色
            leftGradientImageView.backgroundColor = UIColor.white
            rightGradientImageView.backgroundColor = UIColor.white
        }
    }
    @IBAction func gradientSliderChange(_ sender: Any) {
        if gradientSwitch.isOn {
            syncGradientSliderValue()
        }
        else {
            showTurnOnGradientAlert()
        }

    }
    @IBAction func leftGradientRedSliderChange(_ sender: Any) {
        if gradientSwitch.isOn {
            syncGradientSliderValue()
        }
        else {
            showTurnOnGradientAlert()
        }
    }
    @IBAction func leftGradientGreenSliderChange(_ sender: Any) {
        if gradientSwitch.isOn {
            syncGradientSliderValue()
        }
        else {
            showTurnOnGradientAlert()
        }
    }
    @IBAction func leftGradientBlueSliderChange(_ sender: Any) {
        if gradientSwitch.isOn {
            syncGradientSliderValue()
        }
        else {
            showTurnOnGradientAlert()
        }
    }
    @IBAction func leftGradientAlphaSliderChange(_ sender: Any) {
        if gradientSwitch.isOn {
            syncGradientSliderValue()
        }
        else {
            showTurnOnGradientAlert()
        }
    }
    @IBAction func leftGradientRandom(_ sender: Any) {
        if gradientSwitch.isOn {
            leftGradientRedSlider.value = Float(Int.random(in: 1...255))
            leftGradientGreenSlider.value = Float(Int.random(in: 1...255))
            leftGradientBlueSlider.value = Float(Int.random(in: 1...255))
            leftGradientAlphaSlider.value = Float(Int.random(in: 1...255))
            syncGradientSliderValue()
        }
        else {
            showTurnOnGradientAlert()
        }
    }
    @IBAction func rightGradientRedSliderChange(_ sender: Any) {
        if gradientSwitch.isOn {
            syncGradientSliderValue()
        }
        else {
            showTurnOnGradientAlert()
        }
    }
    @IBAction func rightGradientGreenSliderChange(_ sender: Any) {
        if gradientSwitch.isOn {
            syncGradientSliderValue()
        }
        else {
            showTurnOnGradientAlert()
        }
        
    }
    @IBAction func rightGradientBlueSliderChange(_ sender: Any) {
        if gradientSwitch.isOn {
            syncGradientSliderValue()
        }
        else {
            showTurnOnGradientAlert()
        }
        
    }
    @IBAction func rightGradientAlphaSliderChange(_ sender: Any) {
        if gradientSwitch.isOn {
            syncGradientSliderValue()
        }
        else {
            showTurnOnGradientAlert()
        }
        
    }
    @IBAction func rightGradientRandom(_ sender: Any) {
        if gradientSwitch.isOn {
            rightGradientRedSlider.value = Float(Int.random(in: 1...255))
            rightGradientGreenSlider.value = Float(Int.random(in: 1...255))
            rightGradientBlueSlider.value = Float(Int.random(in: 1...255))
            rightGradientAlphaSlider.value = Float(Int.random(in: 1...255))
            syncGradientSliderValue()
        }
        else {
            showTurnOnGradientAlert()
        }

    }
    
    
}

