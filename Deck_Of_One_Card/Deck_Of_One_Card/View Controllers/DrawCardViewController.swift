//
//  DrawCardViewController.swift
//  Deck_Of_One_Card
//
//  Created by Jordan Bryant on 9/22/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

import UIKit

class DrawCardViewController: UIViewController {
    
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        cardImageView.layer.masksToBounds = true
        cardImageView.layer.cornerRadius = 15
        cardImageView.layer.borderColor = UIColor.secondaryLabel.cgColor
        cardImageView.layer.borderWidth = 1
    }
    
    private func fetchImageAndUpdateUI(for card: Card) {
        CardController.fetchImage(for: card) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self.cardImageView.image = image
                    self.cardImageView.layer.borderWidth = 0
                    self.cardLabel.text = "\(card.value.capitalized) of \(card.suit.capitalized)"
                case .failure(let error):
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
    @IBAction func drawButtonTapped(_ sender: Any) {
        CardController.fetchCard { (result) in
            switch result {
            case .success(let card):
                self.fetchImageAndUpdateUI(for: card)
            case .failure(let cardError):
                DispatchQueue.main.async {
                    self.presentErrorToUser(localizedError: cardError)
                }
            }
        }
    }
    
}
