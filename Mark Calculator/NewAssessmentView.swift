//
//  NewAssessmentView.swift
//  Mark Calculator
//
//  Created by T Krobot on 14/10/23.
//

import SwiftUI

struct NewAssessmentView: View {
    @State private var name:String = ""
    @State private var value:Float = 0
    @State private var totalMarks:Float = 0
    @State private var isDone:Bool = false
    @State private var marksAttained:Float = 0
    
    @Binding var subject: Subject
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Form{
            Section("Name"){
                TextField("Name",text: $name)
            }
            Section("Info"){
                HStack{
                    Text("Percentage Value")
                    TextField("Percentage Value",value:$value, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                    Spacer()
                    Text("%")
                }//percentage value
                HStack{
                    Text("Total Marks")
                    TextField("Total Marks",value:$totalMarks, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }//total marks
                Toggle(isOn: $isDone){
                    Text("Is done?")
                }
                if isDone{
                    HStack{
                        Text("Marks Attained")
                        TextField("Marks Attained",value:$marksAttained, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }//Marks attained
                }
            }
            Section("Save"){
                Button("Save"){
                    subject.assessments.append(Assessment(name: name, percentageOfTotal: value, totalMarks: totalMarks, done: isDone, markAttained: marksAttained))
                    dismiss()
                }
            }
        }
    }
}

struct NewAssessmentView_Previews: PreviewProvider {
    static var previews: some View {
        NewAssessmentView(subject: .constant(Subject(name: "Mathematics", assessments: [])))
    }
}
