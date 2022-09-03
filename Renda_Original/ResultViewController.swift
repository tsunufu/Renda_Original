//
//  ResultViewController.swift
//  Renda_Original
//
//  Created by ryo on 2022/08/29.
//

import UIKit

class ResultViewController: UIViewController {
    
    var score = String()
    
    @IBOutlet var scoreText: UILabel!
    @IBOutlet var resultButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scoreText.text = String(score)
        resultButton.layer.cornerRadius = 30
    }
    
    
    
    @IBAction func back() {
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
