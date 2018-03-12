//
//  ViewController.swift
//  Concentration
//
//  Created by ckd－macpro on 2018/3/9.
//  Copyright © 2018年 ckd－macpro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    //懒加载，知道有人使用它，才会初始化，弊端是不能使用属性观察器didSet
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count+1) / 2)
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips:\(flipCount)"
        }
    }    //属性观察器的使用
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!


    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
//        let carNumber = cardButtons.index(of:sender)!
        if let cardNumber = cardButtons.index(of:sender){
//            flipCard(withEmoji: emojiChoice[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else{
            print("chosen card was not in cardButtons")
        }
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for:card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0):#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices=["😀","☺️","😘","🤪","😛","😱","😓","🤭"]

    var emoji = [Int:String]()
    
    func emoji(for card:Card) -> String{
        if emoji[card.identifier] == nil,emojiChoices.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
//        if emoji[card.identifier] != nil{
//            return emoji[card.identifier]!
//        }else{
//            return "?"
//        }
        //简略写法如下
        return emoji[card.identifier] ?? "?"
    }
    
//    @IBAction func touchSecondCard(_ sender: UIButton) {
//        flipCount += 1
//        flipCard(withEmoji:"😃",on:sender)
//    }
    
//    func flipCard(withEmoji emoji:String,on button:UIButton){
//        print("\(emoji)")
//        if button.currentTitle == emoji{
//            button.setTitle("", for: UIControlState.normal)
//            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
//        }else{
//            button.setTitle(emoji, for: UIControlState.normal)
//            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        }
//    }
//
}

