//
//  AssessmentView.swift
//  Mark Calculator
//
//  Created by T Krobot on 14/10/23.
//

import SwiftUI

struct AssessmentView: View {
    @Binding var assess: Assessment
    var body: some View {
        NavigationStack{
            Form{
                Section("Name"){
                    TextField("Name",text: $assess.name)
                }
                Section("Info"){
                    HStack{
                        Text("Percentage Value")
                        TextField("Percentage Value",value:$assess.percentageOfTotal, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                        Spacer()
                        Text("%")
                    }
                    HStack{
                        Text("Total Marks")
                        TextField("Total Marks",value:$assess.totalMarks, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                    Toggle(isOn:$assess.done){
                        Text("Is done?")
                    }
                    if assess.done{
                        HStack{
                            Text("Marks Attained")
                            TextField("Marks Attained",value:$assess.markAttained, formatter: NumberFormatter())
                                .keyboardType(.numberPad)
                        }//Marks attained
                    }
                }
            }
        }
    }
}

struct AssessmentView_Previews: PreviewProvider {
    static var previews: some View {
        AssessmentView(assess: .constant(Assessment(name: "WA1", percentageOfTotal: 15.0, totalMarks: 30.0, done: false, markAttained: 0.0)))
    }
}
