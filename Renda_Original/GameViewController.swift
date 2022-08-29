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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = 3
        score = 0
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapButton() {
        
        if count == 3 {
            number = Int.random(in: 0...13)
            if number == 13 {
                firstImageView.image = UIImage(named: "gobou")
                score += 10
            }
            else if number > 11 {
                firstImageView.image = UIImage(named: "satsumaimo")
                score += 7
            }
            else if number > 7 {
                firstImageView.image = UIImage(named: "shiitake")
                score += 4
            }
            else {
                firstImageView.image = UIImage(named: "kyuuri")
                score += 1
            }
        }
        
        if count == 2 {
            number = Int.random(in: 0...13)
            if number == 13 {
                secondImageView.image = UIImage(named: "gobou")
                score += 10
            }
            else if number > 11 {
                secondImageView.image = UIImage(named: "satsumaimo")
                score += 7
            }
            else if number > 7 {
                secondImageView.image = UIImage(named: "shiitake")
                score += 4
            }
            else {
                secondImageView.image = UIImage(named: "kyuuri")
                score += 1
            }
        }
        
        if count == 1 {
            number = Int.random(in: 0...13)
            if number == 13 {
                thirdImageView.image = UIImage(named: "gobou")
                score += 10
            }
            else if number > 11 {
                thirdImageView.image = UIImage(named: "satsumaimo")
                score += 7
            }
            else if number > 7 {
                thirdImageView.image = UIImage(named: "shiitake")
                score += 4
            }
            else {
                thirdImageView.image = UIImage(named: "kyuuri")
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
