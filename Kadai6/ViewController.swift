//
//  ViewController.swift
//  Kadai6
//
//  Created by 今村京平 on 2021/05/06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var slider: UISlider!
    var randomNum: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.oneMore()
    }
    
    @IBAction private func judgmentBtn(_ sender: Any) {
        
        let sliderValue = Int(slider.value)
        
        if sliderValue == randomNum {
            presentAlert(message: "当たり!\n現在の値\(sliderValue)")
        } else {
            presentAlert(message: "ハズレ\n現在の値\(sliderValue)")
        }
    }
    
    //ラベルに乱数を表示し、スライダーを所定の位置へ
    private func oneMore() {
        slider.value = 50
        self.randomNum = Int(arc4random_uniform(100)) + 1
        label.text = String(randomNum)
    }
    
    //アラートを作成し表示する
    private func presentAlert (message:String){
        //アラートを作成
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        //アラートボタンを作成
        alert.addAction(
            UIAlertAction(title: "再挑戦", style: .default, handler: { (action) -> Void in self.oneMore()})
        )
        //アラートを表示
        present(alert, animated: true, completion: nil)
    }
}

