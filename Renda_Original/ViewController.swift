//
//  ViewController.swift
//  Renda_Original
//
//  Created by ryo on 2022/08/29.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let buttonSound = try!AVAudioPlayer(data: NSDataAsset(name: "kettei")!.data)
    
    @IBOutlet var startButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        startButton.layer.cornerRadius = 30
    }
    
    @IBAction func startButtonTap() {
        //再生時間0に
        buttonSound.currentTime = 0
        
        //再生
        buttonSound.play()
        
    }


}

