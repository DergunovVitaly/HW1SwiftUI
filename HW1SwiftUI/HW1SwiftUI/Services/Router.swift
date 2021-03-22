//
//  Router.swift
//  HW1SwiftUI
//
//  Created by Vitalii Dergunov on 03.03.2021.
//

import Foundation
import SwiftUI

final class Router: ObservableObject {
    @Published var selection = 0
    @Published var isOpenedFastFoodScreen: Bool = false
}
