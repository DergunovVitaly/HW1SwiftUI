//
//  CatalogScreen.swift
//  HW1SwiftUI
//
//  Created by Vitalii Dergunov on 21.03.2021.
//

import SwiftUI
import UIComponents

struct CatalogScreen: View {
    var body: some View {
        NavControllerView() {
            CatalogScreenContent()
        }
    }
}

struct CatalogScreenContent: View {
    
    var column: [GridItem] = Array(repeating: .init(), count: 3)
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    HStack {
                        NavPushButton(destination: SecondScreen()) {
                            Text("Second Screen")
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.gray)
                        }
                        
                        CustomButton {
                            print("Custom Button")
                        } content: {
                            Text("Hello")
                        }
                    }
                    LazyVGrid(columns: column) {
                        ForEach((0...100), id: \.self) {
                            Text("\($0)")
                                .padding()
                                .frame(width: geometry.size.width/3)
                                .background(Color.pink)
                        }
                    }
                }
            }
        }
    }
}

struct SecondScreen: View {
    var body: some View {
        VStack {
            NavPushButton(destination: TwoColumnScreen()) {
                Text("Two Column Screen")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.gray)
            }
            
            NavPopButton() {
                Image(systemName: "arrow.left.circle.fill")
                    .font(.largeTitle)
            }
        }
    }
}

struct CatalogScreen_Previews: PreviewProvider {
    static var previews: some View {
        CatalogScreen()
    }
}
