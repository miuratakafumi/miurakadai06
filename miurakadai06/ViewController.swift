//
//  ViewController.swift
//  miurakadai06
//
//  Created by 三浦貴文 on 2023/05/18.
//

import UIKit

class ViewController: UIViewController {
    
    // ラベルを作成
    @IBOutlet private weak var valueLabel: UILabel!
    // スライダーを作成
    @IBOutlet private weak var slider: UISlider!
    // 画面の初期表示
    override func viewDidLoad() {
        super.viewDidLoad()
        // スライダーの最小値、最大値を設定
        slider.minimumValue = 1
        slider.maximumValue = 100
        // スライダーの初期値を50に設定
        slider.value = 50
        // ラベルにランダムの値を表示
        var randomInt = Int.random(in: 1...100)
        valueLabel.text = String(randomInt)
    }
    
    // ボタン押下時の判定
    @IBAction private func checkButtonPressed(_ sender: Any) {
        // スライダーの値をFloat型からInt型を経由してString型に変換し代入
        let sliderValue = String(Int(slider.value))
        // ラベルバリュー変数にラベルのテキストを代入
        let labelVlue = valueLabel.text
        // スライダーの値とラベルの値が一致しているかどうか判定
        if sliderValue == labelVlue {
            currentShowAlert(title: "結果", message: "あたり!\nあなたの値: \(sliderValue)")
        } else {
            failureShowAlert(title: "結果", message: "はずれ!\nあなたの値: \(sliderValue)")
        }
    }
    
    // 判定の結果、正解だった場合のメソッド
    private func currentShowAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "再挑戦", style: .default, handler: { action in self.resetLabelValue()}))
        present(alert, animated: true, completion: nil)
    }
    
    // 判定の結果、不正解だった場合のメソッド
    private func failureShowAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "再挑戦", style: .default, handler: { action in self.resetLabelValue()}))
        present(alert, animated: true, completion: nil)
    }
    
    // 再挑戦ボタン押下時に新たなランダムの値を取得するメソッド
    private func resetLabelValue() {
        let randomInt = Int.random(in: 1...100)
        valueLabel.text = String(randomInt)
        slider.value = 50
    }
}
