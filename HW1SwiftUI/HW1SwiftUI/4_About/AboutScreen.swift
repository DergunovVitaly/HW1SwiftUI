//
//  AboutScreen.swift
//  HW1SwiftUI
//
//  Created by Vitalii Dergunov on 28.02.2021.
//

import SwiftUI
import AppNetworking

struct AboutScreen: View {
    
    @State private var showCredits: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "star")
                .font(Font.system(size: 100, weight: .medium, design: .default))
            Spacer(minLength: 40)
            Button {
                RecipeAPI.getRecipe(i: "potato") { (data, error) in
//                    print(data)
                }
            } label: {
                Text("Make  network request")
            }
            Spacer()
            Button(action: {
                showCredits.toggle()
            }, label: {
                Text("version 1.0.2")
            })
            Spacer()
        }.sheet(isPresented: $showCredits, content: {
            Text("Modal screen")
        })

    }
}

struct AboutScreen_Previews: PreviewProvider {
    static var previews: some View {
        AboutScreen()
    }
}
