//
//  AboutScreen.swift
//  HW1SwiftUI
//
//  Created by Vitalii Dergunov on 28.02.2021.
//

import SwiftUI

struct AboutScreen: View {
    
    @State private var showCredits: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "star")
                .font(Font.system(size: 100, weight: .medium, design: .default))
            Button(action: {
                showCredits.toggle()
            }, label: {
                Text("version 1.0.2")
            })
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
