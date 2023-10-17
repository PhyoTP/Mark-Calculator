//
//  NewSubjectView.swift
//  Mark Calculator
//
//  Created by T Krobot on 11/10/23.
//

import SwiftUI

struct NewSubjectView: View {
    @State private var subjec = ""
    @State private var counter = 0
    
    @State private var counts:[Int] = []
    @State private var name:[String] = []
    @State private var value:[Float] = []
    @State private var totalMarks:[Float] = []
    @State private var isDone:[Bool] = []
    @State private var marksAttained:[Float] = []
    
    var body: some View {
        Form{
            Section("Subject Info"){
                TextField("Name",text: $subjec)
            }
            Section("Assessments"){
                Button{
                    name.append("")
                    value.append(0.0)
                    totalMarks.append(0.0)
                    isDone.append(false)
                    marksAttained.append(0.0)
                    counter+=1
                    counts.append(counter)
                }label: {
                    HStack{
                        Image(systemName: "plus")
                        Text("Add assessment")
                    }
                }
                ForEach(counts,id: \.self){ count in
                    TextField("Name",text: $name[count-1])
                    HStack{
                        Text("Percentage Value")
                        TextField("Percentage Value",value:$value[count-1], formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                        Spacer()
                        Text("%")
                    }//percentage value
                    HStack{
                        Text("Total Marks")
                        TextField("Total Marks",value:$totalMarks[count-1], formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }//total marks
                    Toggle(isOn: $isDone[count-1]){
                        Text("Is done?")
                    }
                    if isDone[count-1]{
                        HStack{
                            Text("Marks Attained")
                            TextField("Marks Attained",value:$marksAttained[count-1], formatter: NumberFormatter())
                                .keyboardType(.numberPad)
                        }
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
