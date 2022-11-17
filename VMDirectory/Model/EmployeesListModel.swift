//
//  EmployeesListModel.swift
//  VMDirectory
//
//  Created by Asad on 17/11/22.
//

import Foundation

// MARK: - EmployeesListElement
typealias EmployeesList = [EmployeesListElement]

struct EmployeesListElement: Codable {
    let createdAt, firstName: String?
    let avatar: String?
    let lastName, email, jobtitle, favouriteColor: String?
    let id: String?
}



struct EmployeeProfilePresetable {
    var key:String = ""
    var value: String = ""
}
