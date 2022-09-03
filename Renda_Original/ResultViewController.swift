//
//  ResultViewController.swift
//  Renda_Original
//
//  Created by ryo on 2022/08/29.
//

import UIKit
import AVFoundation

class ResultViewController: UIViewController {
    
    var score = Int()
    
    @IBOutlet var scoreText: UILabel!
    @IBOutlet var resultButton: UIButton!
    @IBOutlet var unseiText: UILabel!
    
    let buttonSound = try!AVAudioPlayer(data: NSDataAsset(name: "kettei")!.data)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scoreText.text = String(score)
        resultButton.layer.cornerRadius = 30
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if score >= 3 {
            unseiText.text = "今日のあなたは運が悪すぎる！\n今日は外に出ない方がいいかも?"
        }
        if score >= 6 {
            unseiText.text = "可もなく不可もなく\n平凡な日になるでしょう"
        }
        if score >= 15 {
            unseiText.text = "思い立ったことは\n全てやった方がいいでしょう"
        }
        if score >= 21 {
            unseiText.text = "気になるあの子に告白してみよう！"
        }
        if score >= 27 {
            unseiText.text = "思いがけない出会いがあるかも？"
        }
        if score == 30 {
            unseiText.text = "最高に運がいい！ブラボー！"
        }
        
    }
    
    
    
    @IBAction func back() {
        //再生時間0に
        buttonSound.currentTime = 0
        
        //再生
        buttonSound.play()
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
