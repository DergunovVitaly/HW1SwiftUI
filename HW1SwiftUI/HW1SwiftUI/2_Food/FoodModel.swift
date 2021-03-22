//
//  FoodModel.swift
//  HW1SwiftUI
//
//  Created by Vitalii Dergunov on 28.02.2021.
//

import Foundation

struct FoodModel {
    var name: String
    var emoji: String
    var isFavorite: Bool
}

extension FoodModel: Identifiable {
    var id: String {
        name
    }
}
