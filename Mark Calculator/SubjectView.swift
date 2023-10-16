//
//  SubjectView.swift
//  Mark Calculator
//
//  Created by T Krobot on 11/10/23.
//

import SwiftUI

struct SubjectView: View {
    @Binding var sub: Subject
    var body: some View {
        NavigationStack {
            Form {
                Section("Assessments"){
                    List($sub.assessments,editActions: .all) { $assessment in
                        NavigationLink{
                            AssessmentView()
                        }label: {
                            Text(assessment.name)
                        }
                    }
                    .toolbar{
                        ToolbarItem(placement:.navigationBarLeading){
                            EditButton()
                        }
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button{
                                // Show sheet
                            }label: {
                                HStack {
                                    Image(systemName: "plus")
                                    Text("Add an assessment")
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle(sub.name)
        }
    }
}

struct SubjectView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectView(sub: .constant(Subject(name: "Mathematics", assessments: [Assessment(name: "WA1", percentageOfTotal: 10, totalMarks: 30, done: false, markAttained: 25)], yearDone: false)))
    }
}
