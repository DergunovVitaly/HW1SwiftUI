//
//  FoodScreen.swift
//  HW1SwiftUI
//
//  Created by Vitalii Dergunov on 28.02.2021.
//

import SwiftUI

struct FoodScreen: View {
    
    
    @State var isRoot: Bool = true
    var body: some View {
        if isRoot {
            NavigationView {
                ListView()
            }
        } else {
            ListView()
        }
    }
}

struct ListView: View {
    
    @ObservedObject var viewModel: FoodScreenViewModel = .init()
    @State var favoritesShowed: Bool = false
    
    var body: some View {
        List {
            FilterView(favoritesShowed: $favoritesShowed)
            ForEach(viewModel.foods) { item in
                if !favoritesShowed || item.isFavorite {
                    FoodListCell(food: item)
                }
            }
        }// List
        .navigationTitle("Foods")
    }
}

struct FilterView: View {
    @Binding var favoritesShowed: Bool
    
    var body: some View {
        Toggle(isOn: $favoritesShowed) {
            Text("Favorites")
        }
    }
}

struct FoodListCell: View {
    
    let food: FoodModel
    var body: some View {
        NavigationLink(destination: FoodView(emoji: food.emoji)) {
            Text("\(food.name) \(food.emoji)")
        }
    }
}

struct FoodView: View {
    let emoji: String
    var body: some View {
        Text(emoji)
            .font(Font.system(size: 100, weight: .medium, design: .default))
    }
}

struct FoodScreen_Previews: PreviewProvider {
    static var previews: some View {
        FoodScreen()
    }
}
