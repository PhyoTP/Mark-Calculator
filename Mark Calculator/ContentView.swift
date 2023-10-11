//
//  ContentView.swift
//  Mark Calculator
//
//  Created by T Krobot on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var system = "Select a system"
    var systems = ["MSG", "GPA", "AL", "Overall grade", "N level grading", "JC", "Polytechnic", "5 point", "4 point"]
    @State private var subjects = [Subject(name: "Mathematics", assessments: [Assessment(name: "WA1", percentageOfTotal: 10, totalMarks: 30, done: false, markAttained: 25)])]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Grading System", selection: $system) {
                        ForEach(systems, id: \.self) {
                            Text($0)
                        }
                    }
                }//grading system picker
                
                Section("Subjects") {
                    List($subjects,editActions: .all) { $subject in
                        NavigationLink{
                            SubjectView(sub: $subject.name)
                        }label: {
                            Text(subject.name)
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
                                    Text("Add a subject")
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Mark Calculator")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
