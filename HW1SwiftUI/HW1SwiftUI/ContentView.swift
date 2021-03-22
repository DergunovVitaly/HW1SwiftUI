//
//  ContentView.swift
//  HW1SwiftUI
//
//  Created by Vitalii Dergunov on 28.02.2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        TabView(selection: $router.selection) {
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
            CatalogScreen()
                .tabItem {
                    VStack {
                    Image(systemName: "books.vertical")
                    Text("Catalog")
                    }
                }
                .tag(2)
            AboutScreen()
                .tabItem {
                    VStack {
                    Image(systemName: "star")
                    Text("About")
                    }
                }
                .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
