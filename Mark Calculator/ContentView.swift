//
//  ContentView.swift
//  Mark Calculator
//
//  Created by T Krobot on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView{
            MarkCalculatorView()
                .tabItem(){
                    Label("Mark Calculator", systemImage:"m.circle")
                }
            SettingsView()
                .tabItem(){
                    Label("Settings",systemImage: "gear")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SubjectManager())
    }
}
