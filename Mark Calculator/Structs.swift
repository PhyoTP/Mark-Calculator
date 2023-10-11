//
//  Subject.swift
//  Mark Calculator
//
//  Created by T Krobot on 11/10/23.
//

import Foundation

struct Assessment{
    var name: String
    var percentageOfTotal: Float
    var totalMarks: Float
    var done: Bool
    var markAttained: Float
}

struct Subject: Identifiable{
    var id: UUID = UUID()
    var name: String
    var assessments: [Assessment]
}

func percentage(number:Float,total:Float) -> Float{
    return number/total*100
}
