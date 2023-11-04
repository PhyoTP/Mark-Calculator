//
//  MarkCalculatorView.swift
//  Mark Calculator
//
//  Created by T Krobot on 4/11/23.
//

import SwiftUI

struct MarkCalculatorView: View {
    
    @EnvironmentObject var settings: SubjectManager
    @State private var showSheet = false
    var body: some View {
        NavigationStack {
            Form {
                
                
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

struct MarkCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        MarkCalculatorView()
            .environmentObject(SubjectManager())
    }
}
