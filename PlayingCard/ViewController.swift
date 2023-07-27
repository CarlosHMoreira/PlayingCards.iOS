//
//  ViewController.swift
//  PlayingCard
//
//  Created by Carlos Henrique on 24/07/23.
//

import UIKit

class ViewController: UIViewController {
    var deck = PlayingDeck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 1...10 {
            if let card = deck.draw() {
                print("\(card)")
            }
        }
    }


}

