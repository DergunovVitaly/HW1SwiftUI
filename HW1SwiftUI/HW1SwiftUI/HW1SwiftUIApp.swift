//
//  HW1SwiftUIApp.swift
//  HW1SwiftUI
//
//  Created by Vitalii Dergunov on 28.02.2021.
//

import SwiftUI

@main
struct HW1SwiftUIApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    init() {
        print("▶️ Application is starting up. App initialiser")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
             .environmentObject(FoodScreenViewModel())
             .environmentObject(Router())
        }
        .onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase {
            case .active:
                print("▶️ Application is Active")
            case .background:
                print("⏸ Application is background")
            case .inactive:
                print("⏹ Application is background")
            @unknown default:
                print("⏯ Oh - interesting phase: I've received an unexpected new value.")
            }
        }
    }
}
