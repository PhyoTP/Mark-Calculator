//
//  Subject.swift
//  Mark Calculator
//
//  Created by T Krobot on 11/10/23.
//

import Foundation

struct Assessment{
    var name: String
    var percentage: Int
    var total: Int
}

struct Subject{
    var name: String
    var assessments: [Assessment]
}
