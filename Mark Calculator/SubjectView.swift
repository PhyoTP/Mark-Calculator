//
//  SubjectView.swift
//  Mark Calculator
//
//  Created by T Krobot on 11/10/23.
//

import SwiftUI

struct SubjectView: View {
    @Binding var sub: String
    var body: some View {
        NavigationStack{
            Form{
                Text("hello")
            }
            .navigationTitle(sub)
        }
    }
}

struct SubjectView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectView(sub: .constant("Example Subject"))
    }
}
