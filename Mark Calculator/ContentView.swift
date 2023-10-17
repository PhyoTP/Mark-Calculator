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
    @EnvironmentObject var settings: SubjectManager
    @State private var showSheet = false
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
                    List($settings.subjects,editActions: .all) { $subject in
                        NavigationLink{
                            SubjectView(sub: $subject)
                        }label: {
                            Text(subject.name)
                        }
                    }
                    
                }
            }
            .navigationBarTitle("Mark Calculator")
            .sheet(isPresented: $showSheet){
                NewSubjectView()
                
            }
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
                            Text("Add a subject")
                        }
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SubjectManager())
    }
}
