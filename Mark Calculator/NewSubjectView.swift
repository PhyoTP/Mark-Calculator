//
//  NewSubjectView.swift
//  Mark Calculator
//
//  Created by T Krobot on 11/10/23.
//

import SwiftUI

struct NewSubjectView: View {
    @State private var subjec = ""
    @State private var name:[String] = []
    @State private var stuffer = 0
    @State private var stuff:[Int] = []
    @State private var value:[Float] = []
    var body: some View {
        Form{
            Section("Subject Info"){
                TextField("Name",text: $subjec)
            }
            Section("Assessments"){
                Button{
                    name.append("")
                    value.append(0.0)
                    stuffer+=1
                    stuff.append(stuffer)
                }label: {
                    HStack{
                        Image(systemName: "plus")
                        Text("Add assessment")
                    }
                    
                }
                ForEach(stuff,id: \.self){ something in
                    
                    TextField("Name",text: $name[something-1])
                    HStack{
                        Text("Percentage Value")
                        TextField("Percentage Value",value:$value[something-1], formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                        Spacer()
                        Text("%")
                    }
                    
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
