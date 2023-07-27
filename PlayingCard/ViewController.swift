//
//  ViewController.swift
//  PlayingCard
//
//  Created by Carlos Henrique on 24/07/23.
//

import UIKit

class ViewController: UIViewController {
    var deck = PlayingDeck()
    
    @IBOutlet weak var playingCardView: PlayingCardView! {
        didSet {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.right, .left]
            playingCardView.addGestureRecognizer(swipe)
            
            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(PlayingCardView.adjustFaceCardScale(byHandlingGestureRecognizedBy:)))
                      playingCardView.addGestureRecognizer(pinch)
        }
    }
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case.ended:
            playingCardView.isFaceUp = !playingCardView.isFaceUp
        @unknown default:
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func nextCard() {
        if let card = deck.draw() {
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.rawValue
        }
    }
}

