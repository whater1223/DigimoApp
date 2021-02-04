//
//  DigimoViewController.swift
//  DigimoApp
//
//  Created by 傅培禎 on 2021/2/2.
//

import UIKit
import AVFoundation


struct Qna{
    var question:String
    var answer:[String]
    var correctAnwer:Int
    
}

class DigimoViewController: UIViewController {

    
    var queuePlayer = AVQueuePlayer()
        var playerLooper: AVPlayerLooper?

    
        
        
        @IBOutlet weak var myQuestion: UILabel!
        @IBOutlet weak var myQuestionNumber: UILabel!
        @IBOutlet weak var myScore: UILabel!
        @IBOutlet var selectedButton: [UIButton]!
        @IBOutlet weak var button1: UIButton!
        @IBOutlet weak var button2: UIButton!
        @IBOutlet weak var button3: UIButton!
        @IBOutlet weak var button4: UIButton!
        
        @IBOutlet weak var mynextButton: UIButton!
        
        @IBOutlet weak var restartbutton: UIButton!
        
        @IBOutlet weak var firstImage: UILabel!
        
        @IBOutlet weak var tangImage: UIImageView!
     
        var audioPlayer:AVAudioPlayer?
        
        //題數
        var topicNumber = 0
        //正確答案
        var correctAnswerNumber = 0
        //分數
        var score = 0
        //不超過總題數
        var waringNumber = 0
        
    var questionArray = [Qna(question: "下列何者非數碼寶貝？", answer: ["1. 亞古獸","3. 天使獸","2. 大便獸","4. 長頸鹿"], correctAnwer: 4),Qna(question: "下列何者是'數碼寶貝大冒險'的主角之一？", answer: ["1. 小白","3. 碳次郎","2. 八神太一","4. 李白"], correctAnwer: 3),Qna(question: "'數碼寶貝大冒險'的舞台在日本的何處？", answer: ["1. 北海道","3. 東京","2. 大阪","4. 京都"], correctAnwer: 2),Qna(question: "八神太一的徽章代表了什麼樣的特質", answer: ["1. 橙色勇氣","3. 藍色友情","2. 紅色愛心","4. 金色希望"], correctAnwer: 1),Qna(question: "'數碼寶貝大冒險'的片頭曲是？", answer: ["1. It's my life","3. Butter-Fly","2. flower dance","4. Flashlight"], correctAnwer: 2),Qna(question: "'數碼寶貝大冒險'的亞古獸進化是什麼？", answer: ["1. 惡魔獸","3. 仙女獸","2. 仙人掌獸","4. 暴龍獸"], correctAnwer: 4),Qna(question: "數碼獸存在於何處？", answer: ["1. 大海","3. 深山","2. 網際網路","4. 外太空"], correctAnwer: 3),Qna(question: "武之內空的數碼寶貝是？", answer: ["1. 亞古獸","3. 大便獸","2. 加布獸","4. 海豚獸"], correctAnwer: 3),Qna(question: "太刀川美美的數碼寶貝是？", answer: ["1. 垃圾獸","3. 加布獸","2. 巴魯獸","4. 海豚獸"], correctAnwer: 3),Qna(question: "八神光的數碼寶貝是？", answer: ["1. 比丘獸","3. 加布獸","2. 迪路獸","4. 海豚獸"], correctAnwer: 3)]
    
    @IBAction func UnWind(for segue :UIStoryboardSegue)
    {
    }
        
        @IBAction func nextButtonPressed(_ sender: UIButton) {

            myQuestion.isHidden = false
            mynextButton.setTitle("next", for: .normal)
            myQuestion.text = questionArray[waringNumber].question
            correctAnswerNumber = questionArray[waringNumber].correctAnwer
       
            //用迴圈把答案選項放入按鈕,selectedButton是一個outlet collection
            for i in 0 ..< selectedButton.count{
    selectedButton[i].setTitle(questionArray[waringNumber].answer[i], for: .normal)
            }
            
            waringNumber += 1
            topicNumber += 1
            myQuestionNumber.text = "第\(topicNumber)題"
            
            button1.isHidden = false
            button2.isHidden = false
            button3.isHidden = false
            button4.isHidden = false
            myQuestionNumber.isHidden = false
            firstImage.isHidden = true
        }
        
        
        
        @IBAction func selectedButton1(_ sender: UIButton) {
            
            if correctAnswerNumber == 1{
                score += 10
                myScore.text = "分數： \(score)"
                button2.isHidden = true
                button3.isHidden = true
                button4.isHidden = true
            }else{
                score -= 10
                myScore.text = "分數： \(score)"
            }
            //總共10題，到第10題選項按下去就跳出總分視窗
            if waringNumber == 10{
                waringNumber = 0
                performSegue(withIdentifier: "showResult", sender: nil)
                warning()
            }
           
                
        }
        
        
        @IBAction func selectedButton2(_ sender: UIButton) {
            
            if correctAnswerNumber == 2{
                score += 10
                myScore.text = "分數： \(score)"
                button1.isHidden = true
                button3.isHidden = true
                button4.isHidden = true
            }else{
                score -= 10
                myScore.text = "分數： \(score)"
                
            }
            //總共10題，到第10題選項按下去就跳出總分視窗
            if waringNumber == 10{
                waringNumber = 0
                performSegue(withIdentifier: "showResult", sender: nil)
                warning()
            }
           
        }
        
        @IBAction func selectedButton3(_ sender: UIButton) {
            if correctAnswerNumber == 3{
                score += 10
                myScore.text = "分數： \(score)"
                button1.isHidden = true
                button2.isHidden = true
                button4.isHidden = true
            }else{
                score -= 10
                myScore.text = "分數： \(score)"
            }
            //總共10題，到第10題選項按下去就跳出總分視窗
            if waringNumber == 10{
                waringNumber = 0
                performSegue(withIdentifier: "showResult", sender: nil)
                
               warning()
            }
            
        }
        
        @IBAction func selectedButton4(_ sender: UIButton) {
            if correctAnswerNumber == 4{
                score += 10
                myScore.text = "分數： \(score)"
                button1.isHidden = true
                button2.isHidden = true
                button3.isHidden = true
            }else{
                score -= 10
                myScore.text = "分數： \(score)"
                
            }
         //總共10題，到第10題選項按下去就跳出總分視窗
            if waringNumber == 10{
                waringNumber = 0
                performSegue(withIdentifier: "showResult", sender: nil)
                
                
               warning()
            }
        }
        
        
        //重玩
        func reStart(){
            
            myQuestion.isHidden = true
            myQuestionNumber.isHidden = true
            firstImage.isHidden = false
            button1.isHidden = true
            button2.isHidden = true
            button3.isHidden = true
            button4.isHidden = true
            topicNumber = 0
            score = 0
            myScore.text = "分數： ---"
            
            
        }
        
        //加入警告控制器
        func warning () {
            var myScore = ""
            if  score <= 30{
                myScore = "數碼寶貝看得還不夠多唷！"
            }else if score >= 40{
                myScore = "恭喜你成為數碼寶貝大師！"
            }
            let alert =  UIAlertController(title: myScore, message: "\(score)分", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "重新開始", style: .default, handler:{ UIAlertAction in  self.reStart()})
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
            
        }
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            //畫面讀入時取亂數(不會重複題目)
            questionArray.shuffle()
            
            button1.isHidden = true
            button2.isHidden = true
            button3.isHidden = true
            button4.isHidden = true
            
            guard let url = Bundle.main.url(forResource: "food", withExtension: "mp3") else { return }
                    let playerItem = AVPlayerItem(asset: AVAsset(url: url))
                    playerLooper = AVPlayerLooper(player: queuePlayer, templateItem: playerItem)
                    queuePlayer.play()
            
    
        }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showResult" {
//            if let vc = segue.destination as? ResultViewController {
//                vc.scroe = self.score
//            }
//        }
//    }

    @IBSegueAction func showResult(_ coder: NSCoder) -> ResultViewController? {
        
        
        let controller = ResultViewController(coder: coder)
        controller?.point = score
        
        return controller
    }
    

    }



