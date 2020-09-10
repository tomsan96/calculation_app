//
//  ViewController.swift
//  Calculator
//
//  Created by 山崎定知 on 2020/09/03.
//  Copyright © 2020 山崎定知. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    // 符号押下前の数字
    var beforeNumber: Int?
    // 符号押下後の数字
    var afterNumber: Int?
    // 計算結果
    var resultNumber:Int = 0
    // 符号
    var sign = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func acBtn(_ sender: Any) {
        
        beforeNumber = nil
        afterNumber = nil
        resultNumber = 0
        sign = 0
        result.text = String(resultNumber)
    }
    
    @IBAction func cBtn(_ sender: Any) {
        
        afterNumber = 0
        result.text = String(afterNumber!)
    }
    
    @IBAction func calculationBtn(_ sender: Any) {
        // 前回押した符号による計算処理をする
        calculate()
        if result.text == "エラー" {
            // 後続処理を行わない
            return
        }
        
        let button:UIButton = sender as! UIButton
        sign = button.tag
        
        beforeNumber = resultNumber
        afterNumber = nil
        result.text = String(resultNumber)
    }



    @IBAction func numberBtn(_ sender: Any) {
        
        let button:UIButton = sender as! UIButton
        if afterNumber != nil {
            //直前に数字を入力している場合
            afterNumber = Int(String(afterNumber!) + String(button.tag))
        } else {
            afterNumber = button.tag
        }
        
        result.text = String(afterNumber!)
        
    }
    
    func calculate() {
        
        if beforeNumber != nil && afterNumber != nil  {
            // 計算対象となる2つの数字が入力されている場合
            // sign 1:加算, 2:減算, 3:乗算, 4:除算, 0:イコール
            if sign == 1 {
                resultNumber = beforeNumber! + afterNumber!
            } else if sign == 2 {
                resultNumber = beforeNumber! - afterNumber!
            } else if sign == 3 {
                resultNumber = beforeNumber! * afterNumber!
            } else if sign == 4 {
                // 0で割る場合
                if afterNumber == 0 {
                    result.text = "エラー"
                    
                    beforeNumber = nil
                    afterNumber = nil
                    resultNumber = 0
                    sign = 0
                    return
                }
                resultNumber = beforeNumber! / afterNumber!
            } else if sign == 0 {
                resultNumber = afterNumber!
            }
        
        } else if afterNumber != nil {
            resultNumber = afterNumber!
            
        }

    }
}

