//
//  ContentView.swift
//  HW1SwiftUI
//
//  Created by Vitalii Dergunov on 28.02.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            DashboardScreen()
                .tabItem {
                    VStack {
                    Image(systemName: "star")
                    Text("Main")
                    }
                }
                .tag(0)
            FoodScreen()
                .tabItem {
                    VStack {
                    Image(systemName: "pills")
                    Text("Food")
                    }
                }
                .tag(1)
            AboutScreen()
                .tabItem {
                    VStack {
                    Image(systemName: "star")
                    Text("About")
                    }
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
