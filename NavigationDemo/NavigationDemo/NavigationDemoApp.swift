//
//  NavigationDemoApp.swift
//  NavigationDemo
//
//  Created by Yogesh Bhatt on 21/10/23.
//

import SwiftUI

@main
struct NavigationDemoApp: App {
    // Root
    @ObservedObject var screenState = UserSettings()
    var body: some Scene {
        WindowGroup {
            getViews(state: screenState.state)
                .environmentObject(screenState)
            // using environmentObject we are passing "screenState.state" to all child views
        }
    }
    @ViewBuilder
    func getViews(state: ScreenType) -> some View {
        // Responsible to change screens
        switch state {
        case .ContentView:
            ContentView(isActive: false)
        case .Screen1:
            Screen1()
        case .Screen2:
            Screen2()
        case .Screen3:
            Screen3()
        case .Screen4:
            Screen4()
        }
    }
}
enum ScreenType {
    case ContentView
    case Screen1
    case Screen2
    case Screen3
    case Screen4
}
// UserSettings is responsible to manage Screens navigation
class UserSettings: ObservableObject {
    @Published var state: ScreenType = .ContentView
}
