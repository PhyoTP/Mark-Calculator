//
//  SubjectView.swift
//  Mark Calculator
//
//  Created by T Krobot on 11/10/23.
//

import SwiftUI

struct SubjectView: View {
    @Binding var sub: Subject
    @State private var showSheet = false
    var body: some View {
        NavigationStack {
            Form {
                Section("Name"){
                    TextField("Name",text: $sub.name)
                }
                Section("Assessments"){
                    List($sub.assessments,editActions: .all) { $assessment in
                        NavigationLink{
                            AssessmentView(assess: $assessment)
                        }label: {
                            Text(assessment.name)
                        }
                    }
                    
                }
            }
            .navigationTitle(sub.name)
            .toolbar{
                ToolbarItem(placement:.navigationBarLeading){
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        showSheet = true
                    }label: {
                        HStack {
                            Image(systemName: "plus")
                            Text("Add an assessment")
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showSheet){
            NewAssessmentView(subject: $sub)
        }
    }
}

struct SubjectView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectView(sub: .constant(Subject(name: "Mathematics", assessments: [Assessment(name: "WA1", percentageOfTotal: 10, totalMarks: 30, done: true, markAttained: 25),Assessment(name: "WA2", percentageOfTotal: 15, totalMarks: 45, done: false, markAttained: 0)])))
    }
}
