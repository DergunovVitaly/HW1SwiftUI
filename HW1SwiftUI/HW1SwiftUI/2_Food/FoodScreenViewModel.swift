//
//  FoodScreenViewModel.swift
//  HW1SwiftUI
//
//  Created by Vitalii Dergunov on 28.02.2021.
//

import SwiftUI
import Combine

final class FoodScreenViewModel: ObservableObject {
    @Published private(set) var foods = [
        FoodModel(name: "Strawberry", emoji: "🍓", isFavorite: true),
        FoodModel(name: "Apple", emoji: "🍎", isFavorite: true),
        FoodModel(name: "Cheese", emoji: "🧀", isFavorite: false),
        FoodModel(name: "Tomato", emoji: "🍅", isFavorite: false),
        FoodModel(name: "Salt", emoji: "🥗", isFavorite: true)
    ]
}
