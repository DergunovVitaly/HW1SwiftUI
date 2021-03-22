//
//  NavigationStack.swift
//  
//
//  Created by Vitalii Dergunov on 21.03.2021.
//

import SwiftUI

// MARK: - Models
private struct Screen: Identifiable, Equatable {
    let id: String
    let nextScreen: AnyView
    
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        lhs.id == rhs.id
    }
}

private struct ScreenStack {
    private var screens: [Screen] = .init()
    
    func top() -> Screen? {
        screens.last
    }
    
    mutating func push(_ s: Screen) {
        screens.append(s)
    }
    
    mutating func popToPrevious() {
        _ = screens.popLast()
    }
    
    mutating func popToRoot() {
        screens.removeAll()
    }
}

// MARK: - View Models
public enum PopDestination {
    case previous
    case root
}

enum NavType {
    case push
    case pop
}

public final class NavControllerViewModel: ObservableObject {
    
    @Published fileprivate var currentScreen: Screen?
    
    private var screenStack: ScreenStack = .init() {
        didSet {
            currentScreen = screenStack.top()
        }
    }
    
    func push<S: View>(_ screenView: S) {
        let screen: Screen = .init(id: UUID().uuidString, nextScreen: AnyView(screenView))
        screenStack.push(screen)
    }
    
    func pop(to: PopDestination) {
        screenStack.popToPrevious()
    }
}

// MARK: - UI

public struct NavControllerView<Content>: View where Content: View {
    
    @ObservedObject var viewModel: NavControllerViewModel
    
    private let content: Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        viewModel = NavControllerViewModel()
        self.content = content()
    }
    
    public var body: some View {
        let isRoot = viewModel.currentScreen == nil
        ZStack {
            if isRoot {
                content
                    .environmentObject(viewModel)
            } else {
                viewModel.currentScreen!.nextScreen.environmentObject(viewModel)
            }
        }
    }
}

public struct NavPushButton<Label, Destination>: View where Label: View, Destination: View {
    @EnvironmentObject var viewModel: NavControllerViewModel
    private let label: () -> Label
    private let destination: Destination
    
    public init(destination: Destination, @ViewBuilder label: @escaping () -> Label) {
        self.label = label
        self.destination = destination
    }
    
    public var body: some View {
        label().onTapGesture {
            viewModel.push(destination)
        }
    }
}

public struct NavPopButton<Label>: View where Label: View {
    @EnvironmentObject var viewModel: NavControllerViewModel
    private let label: () -> Label
    
    public init(@ViewBuilder label: @escaping () -> Label) {
        self.label = label
    }
    
    public var body: some View {
        label().onTapGesture {
            viewModel.pop(to: <#PopDestination#>)
        }
    }
}
