//
//  DashboardScreen.swift
//  HW1SwiftUI
//
//  Created by Vitalii Dergunov on 28.02.2021.
//

import SwiftUI

struct DashboardScreen: View {
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: SeparateView()) {
                Text("I like pizza")
            }.navigationBarTitle(Text("Dashboard"))
        }
    }
}

struct SeparateView: View {
    var body: some View {
        VStack {
            FoodScreen(isRoot: false)
            FoodView(emoji: "🍕🍕🍕")
        }
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
