//
//  GameViewController.swift
//  Renda_Original
//
//  Created by ryo on 2022/08/29.
//

import UIKit

class GameViewController: UIViewController {
    
    var score: Int! //score表示用
    var count: Int! //残り回数
    var number: Int! //乱数生成用
    
    @IBOutlet var firstImageView: UIImageView!
    @IBOutlet var secondImageView: UIImageView!
    @IBOutlet var thirdImageView: UIImageView!
    
    @IBOutlet var scoreText: UILabel!
    
    //スロットぐるぐる用
    @IBOutlet weak var firstSlotImageView: UIImageView!
    @IBOutlet weak var secondSlotImageView: UIImageView!
    @IBOutlet weak var thirdSlotImageView: UIImageView!
    
    //スロットぐるぐるタイマー
    var timer: Timer = Timer()
    
    //表示する画像の番号
    var dispImageNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = 3
        score = 0
        
        //最初はきゅうり
        let image = UIImage(named: "kyuuri")
        firstSlotImageView.image = image
        
        //タイマーセット
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }
    
    func displayImage() {

        // 画像の名前の配列
        let firstImageNameArray = [
            "satsumaimo",
            "shiitake",
            "kyuuri",
            "gobou"
            ]
        
        let secondImageNameArray = [
            "shiitake",
            "gobou",
            "kyuuri",
            "satsumaimo"
            ]
        
        let thirdImageNameArray = [
            "kyuuri",
            "gobou",
            "satsumaimo",
            "shiitake"
            
        ]

        // 画像の番号が正常な範囲を指しているかチェック

        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNumber < 0 {
            dispImageNumber = 3
        }

        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNumber > 3 {
            dispImageNumber = 0
        }

        // 表示している画像の番号から名前を取り出し
        let firstName = firstImageNameArray[dispImageNumber]
        let secondName = secondImageNameArray[dispImageNumber]
        let thirdName = thirdImageNameArray[dispImageNumber]

        // 画像を読み込み
        let firstImage = UIImage(named: firstName)
        let secondImage = UIImage(named: secondName)
        let thirdImage = UIImage(named: thirdName)

        // Image Viewに読み込んだ画像をセット
        firstSlotImageView.image = firstImage
        secondSlotImageView.image = secondImage
        thirdSlotImageView.image = thirdImage
    }
    
    //タイマーによって一定の関数で呼び出される関数
    @objc func onTimer() {
//        print("onTimer")
        
        //画像の番号増やす
        dispImageNumber += 1
        
        //画像表示
        displayImage()
    }
    
    @IBAction func tapButton() {
        
        if count == 3 {
            number = Int.random(in: 0...13)
            if number == 13 {
                firstImageView.image = UIImage(named: "gobou")
                firstSlotImageView.isHidden = true
                score += 10
            }
            else if number > 11 {
                firstImageView.image = UIImage(named: "satsumaimo")
                firstSlotImageView.isHidden = true
                score += 7
            }
            else if number > 7 {
                firstImageView.image = UIImage(named: "shiitake")
                firstSlotImageView.isHidden = true
                score += 4
            }
            else {
                firstImageView.image = UIImage(named: "kyuuri")
                firstSlotImageView.isHidden = true
                score += 1
            }
        }
        
        if count == 2 {
            number = Int.random(in: 0...13)
            if number == 13 {
                secondImageView.image = UIImage(named: "gobou")
                secondSlotImageView.isHidden = true
                score += 10
            }
            else if number > 11 {
                secondImageView.image = UIImage(named: "satsumaimo")
                secondSlotImageView.isHidden = true
                score += 7
            }
            else if number > 7 {
                secondImageView.image = UIImage(named: "shiitake")
                secondSlotImageView.isHidden = true
                score += 4
            }
            else {
                secondImageView.image = UIImage(named: "kyuuri")
                secondSlotImageView.isHidden = true
                score += 1
            }
        }
        
        if count == 1 {
            number = Int.random(in: 0...13)
            if number == 13 {
                thirdImageView.image = UIImage(named: "gobou")
                thirdSlotImageView.isHidden = true
                score += 10
            }
            else if number > 11 {
                thirdImageView.image = UIImage(named: "satsumaimo")
                thirdSlotImageView.isHidden = true
                score += 7
            }
            else if number > 7 {
                thirdImageView.image = UIImage(named: "shiitake")
                thirdSlotImageView.isHidden = true
                score += 4
            }
            else {
                thirdImageView.image = UIImage(named: "kyuuri")
                thirdSlotImageView.isHidden = true
                score += 1
            }
        }
        
        if firstImageView.image == secondImageView.image && firstImageView.image == thirdImageView.image {
            score += 5
        }
        
        count -= 1
        
    }
    
    
    @IBAction func goResult(_ sender: Any) {
        let resultVC = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController
        if let resultVC = resultVC {
            resultVC.score = String(score)
            count = 3
            score = 0
            firstImageView.image = nil
            secondImageView.image = nil
            thirdImageView.image = nil
            firstSlotImageView.isHidden = false
            secondSlotImageView.isHidden = false
            thirdSlotImageView.isHidden = false
            resultVC.modalTransitionStyle = .crossDissolve
            self.present(resultVC, animated: true, completion: nil)
        }
        
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
