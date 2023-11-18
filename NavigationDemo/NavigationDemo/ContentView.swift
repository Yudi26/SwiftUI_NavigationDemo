//
//  ContentView.swift
//  NavigationDemo
//
//  Created by Yogesh Bhatt on 21/10/23.
//

import SwiftUI
struct ContentView: View {
    /// for changing screens
    @EnvironmentObject var userSettings: UserSettings
    /// for Pushing screens
    @State var isActive : Bool = false
    var body: some View {
        NavigationView {
            VStack {
                Text("SwiftUI Navigation")
                    .font(.title)
                    .bold()
                Spacer()
                NavigationLink(
                    destination: ContentView1(rootIsActive: $isActive),
                    isActive: $isActive) {
                        Text("Push to ContentView1")
                    }
                Button("Screen 1") {
                    /// Responsible to change screen
                    /// Since userSettings.state chnages are observed in NavigationDemoApp (Root)
                    userSettings.state = .Screen1
                }
                Spacer()
            }
        }
    }
}
struct ContentView1: View {
    @Binding var rootIsActive: Bool
    @State var toContentView2: Bool = false
    @EnvironmentObject var userSettings: UserSettings
    var body: some View {
        VStack {
            Text("SwiftUI Navigation")
                .font(.title)
                .bold()
            Spacer()
            NavigationLink(
                destination: ContentView2(shouldPopToRootView: $rootIsActive),
                isActive: $toContentView2) {
                    Text("Push to ContentView 2")
                }
            Button("Screen 1") {
                /// Responsible to change screen
                /// Since userSettings.state chnages are observed in NavigationDemoApp (Root)
                userSettings.state = .Screen1
            }.foregroundColor(.black)
            Spacer()
        }
    }
}
struct ContentView2: View {
    @EnvironmentObject var userSettings: UserSettings
    /// For Poping to root screen
    @Binding var shouldPopToRootView : Bool
    var body: some View {
        VStack {
            Text("SwiftUI Navigation")
                .font(.title)
                .bold()
            Spacer()
            Button("Pop To Root Screen") {
                shouldPopToRootView = false
            }
            Button("Show Screen 1") {
                /// Responsible to change screen
                /// Since userSettings.state chnages are observed in NavigationDemoApp (Root)
                userSettings.state = .Screen1
            }
            Spacer()
        }
    }
}

struct Screen1: View {
    @EnvironmentObject var userSettings: UserSettings
    var body: some View {
        VStack {
            Text("Screen 1")
                .font(.title)
                .bold()
            Spacer()
            Button("Show Screen 2") {
                /// Responsible to change screen
                /// Since userSettings.state chnages are observed in NavigationDemoApp (Root)
                userSettings.state = .Screen2
            }
            Spacer()
        }
        .padding()
    }
}
#Preview {
    Screen1()
}
struct Screen2: View {
    @EnvironmentObject var userSettings: UserSettings
    var body: some View {
        VStack {
            Text("Screen 2")
                .font(.title)
                .bold()
            Spacer()
            Button("Show Screen 3") {
                /// Responsible to change screen
                /// Since userSettings.state chnages are observed in NavigationDemoApp (Root)
                userSettings.state = .Screen3
            }
            Spacer()
        }
        .padding()
    }
}
#Preview {
    Screen2()
}
struct Screen3: View {
    @EnvironmentObject var userSettings: UserSettings
    var body: some View {
        VStack {
            Text("Screen 3")
                .font(.title)
                .bold()
            Spacer()
            Button("Show Screen 4") {
                /// Responsible to change screen
                /// Since userSettings.state chnages are observed in NavigationDemoApp (Root)
                userSettings.state = .Screen4
            }
            Spacer()
        }
        .padding()
    }
}
#Preview {
    Screen3()
}
struct Screen4: View {
    @EnvironmentObject var userSettings: UserSettings
    var body: some View {
        VStack {
            Text("Screen 4")
                .font(.title)
                .bold()
            Spacer()
            Button("Show Screen 1") {
                /// Responsible to change screen
                /// Since userSettings.state chnages are observed in NavigationDemoApp (Root)
                userSettings.state = .ContentView
            }
            Spacer()
        }
        .padding()
    }
}
#Preview {
    Screen4()
}
