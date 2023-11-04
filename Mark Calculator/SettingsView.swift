//
//  SettingView.swift
//  Mark Calculator
//
//  Created by T Krobot on 4/11/23.
//

import SwiftUI

struct SettingsView: View {
    @State private var system = "Select a system"
    var systems = ["MSG", "GPA", "AL", "Overall grade", "N level grading", "JC", "Polytechnic", "5 point", "4 point"]
    var body: some View {
        Form{
            Section{
                Picker("Grading System", selection: $system) {
                    ForEach(systems, id: \.self) {
                        Text($0)
                    }
                }
            }//grading system picker
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
