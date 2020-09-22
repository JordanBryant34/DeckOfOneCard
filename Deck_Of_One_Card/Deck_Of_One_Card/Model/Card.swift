//
//  Card.swift
//  Deck_Of_One_Card
//
//  Created by Jordan Bryant on 9/22/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

import Foundation

struct TopLevelObject: Decodable {
    let cards: [Card]
}

struct Card: Decodable {
    let value: String
    let suit: String
    let image: URL
}
