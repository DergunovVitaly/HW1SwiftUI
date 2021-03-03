//
//  DashboardScreen.swift
//  HW1SwiftUI
//
//  Created by Vitalii Dergunov on 28.02.2021.
//

import SwiftUI

struct DashboardScreen: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
        Text("Start Page")
            Button(action: {
                router.selection = 1
                router.isOpenedFastFoodScreen = true
            }, label: {
                Text("Show Fast Food")
            })
            .padding()
            .foregroundColor(.orange)
            .background(Color.gray)
            .cornerRadius(9)
        }
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
