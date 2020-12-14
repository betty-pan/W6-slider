//
//  ViewController.swift
//  W6 slide
//
//  Created by BettyPan on 2020/12/10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var female: UIImageView!
    @IBOutlet weak var male: UIImageView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var heart: UIImageView!
    @IBOutlet weak var bubble1: UIImageView!
    @IBOutlet weak var bubble2: UIImageView!
    @IBOutlet weak var bubble3: UIImageView!
    @IBOutlet weak var bubble4: UIImageView!
    @IBOutlet weak var bird: UIImageView!
   
    func updateLocation(degrees: CGFloat) {
        bird.transform = CGAffineTransform.identity.rotated(by: CGFloat.pi/180*degrees).translatedBy(x: 0, y: -230)
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //漸層背景色
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.colors = [
            UIColor(red: 1, green: 175/255, blue: 189/255, alpha: 0.6).cgColor,
            UIColor(red: 1, green: 195/255, blue: 160/255, alpha: 0.6).cgColor
        ]
        //insertSubLayer置於最底層，如使addSubLayer將置於頂層。
        view.layer.insertSublayer(gradientLayer, at: 0)
      
        //設定鳥飛行起點
        updateLocation(degrees: 270)
    }

    @IBAction func slider(_ sender: UISlider) {
        //水平移動設定(+:左至右, -:右至左)
        let speed = sender.value * 0.3
        female.frame.origin.x = CGFloat(152+speed)
        male.frame.origin.x = CGFloat(496-speed)
        
        //愛心透明度
        heart.alpha = CGFloat(sender.value/360)
        
        //泡泡垂直移動(+:上至下, -:下至上)
        bubble1.frame.origin.y = CGFloat(189-speed/4)
        bubble2.frame.origin.y = CGFloat(5-speed/3)
        bubble3.frame.origin.y = CGFloat(20-speed/5)
        bubble4.frame.origin.y = CGFloat(278-speed/2)
        
        //鳥飛半圓形sender.value/2，若飛圓形無需/2
        updateLocation(degrees: CGFloat(sender.value/2)+270)
        
        
    }
   
    
    
        
    }
    

