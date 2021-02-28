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
            DashboardView()
                .tabItem {
                    Text("Main")
                }
            DashboardView()
                .tabItem {
                    Text("Main")
                }
            DashboardView()
                .tabItem {
                    Text("Main")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - Views

struct DashboardView: View {
    var body: some View {
        Text("Start Page")
    }
}
