//
//  NewSubjectView.swift
//  Mark Calculator
//
//  Created by T Krobot on 11/10/23.
//

import SwiftUI

struct NewSubjectView: View {
    @State private var name = ""
    @State private var stuff:[String] = []
    @State private var stuffer = 0
    @State private var stuffed:[Int] = []
    var body: some View {
        Form{
            Section("Subject Info"){
                TextField("Name",text: $name)
            }
            Section("Assessments"){
                Button{
                    stuff.append("")
                    stuffer+=1
                    stuffed.append(stuffer)
                }label: {
                    HStack{
                        Image(systemName: "plus")
                        Text("Add assessment")
                    }
                    
                }
                ForEach(stuffed,id: \.self){ something in
                    TextField("Name",text: $stuff[something-1])
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
