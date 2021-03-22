//
//  CustomButton.swift
//  
//
//  Created by Vitalii Dergunov on 21.03.2021.
//

import SwiftUI

public struct CustomButton<Content>: View where Content: View {
    
    private let action: () -> Void
    private let content: () -> Content
    
    @State private var isTapped: Bool = false
    
   public init(action: @escaping () -> Void, @ViewBuilder content: @escaping () -> Content) {
        self.action = action
        self.content = content
    }
    
    public var body: some View {
       content()
        .font(.title)
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(7)
        .onTapGesture {
            action()
        }
        .onLongPressGesture(minimumDuration: 100, pressing: { isPressing in
            isTapped  = isPressing
        }, perform: {
            
        })
        .opacity(isTapped ? 0.4 : 1)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(action: {
            print("CustomButton")
        }, content: {
            Text("Help")
        })
        
        CustomButton(action: {
            print("CustomButton")
        }, content: {
            Text("Enter")
        })
    }
}
