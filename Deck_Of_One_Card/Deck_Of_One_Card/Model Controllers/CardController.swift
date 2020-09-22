//
//  CardController.swift
//  Deck_Of_One_Card
//
//  Created by Jordan Bryant on 9/22/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

import Foundation
import UIKit.UIImage

class CardController {
    
    static private let baseUrl = "https://deckofcardsapi.com/api"
    
    static func fetchCard(completion: @escaping (Result <Card, CardError>) -> Void) {
        guard let url = URL(string: "\(baseUrl)/deck/new/draw/?count=1") else { return(completion(.failure(.invalidURL))) }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(.thrownError(error)))
            }
            
            guard let data = data else { return completion(.failure(.noData)) }
            
            do {
                let decoder = JSONDecoder()
                let topLevelObject = try decoder.decode(TopLevelObject.self, from: data)
                guard let card = topLevelObject.cards.first else { return completion(.failure(.noData)) }
                completion(.success(card))
            } catch {
                completion(.failure(.thrownError(error)))
            }
            
        }.resume()
    }
    
    static func fetchImage(for card: Card, completion: @escaping (Result <UIImage, CardError>) -> Void) {
        let url = card.image
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(.failure(.thrownError(error)))
            }
            
            guard let data = data else { return completion(.failure(.noData)) }
            
            guard let image = UIImage(data: data) else { return completion(.failure(.unableToDecode)) }
            completion(.success(image))
        }.resume()
    }
}
