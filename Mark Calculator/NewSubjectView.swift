//
//  NewSubjectView.swift
//  Mark Calculator
//
//  Created by T Krobot on 11/10/23.
//

import SwiftUI

struct NewSubjectView: View {
    @State private var name = ""
    @State private var stuff:[Assessment] = []
    var body: some View {
        Form{
            Section("Subject Info"){
                TextField("Name",text: $name)
            }
            Section("Assessments"){
                Button{
                    stuff.append(Assessment(name: "ggsdr", percentageOfTotal: 0.0, totalMarks: 0.0, done: true, markAttained: 0.0))
                }label: {
                    HStack{
                        Image(systemName: "plus")
                        Text("Add assessment")
                    }
                    
                }
                ForEach(stuff){ something in
                    Text("hello")
                }
            }
        }
    }
}

struct NewSubjectView_Previews: PreviewProvider {
    static var previews: some View {
        NewSubjectView()
    }
}
