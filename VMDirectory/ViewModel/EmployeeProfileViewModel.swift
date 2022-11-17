//
//  EmployeeProfileViewModel.swift
//  VMDirectory
//
//  Created by Asad on 17/11/22.
//

import UIKit

class EmployeeProfileViewModel: NSObject {
    var m_employee:EmployeesListElement?
    var m_employeePresntableArray = [EmployeeProfilePresetable]()
    func prepareDataToDisplay() {
        

        m_employeePresntableArray.removeAll()
        let fullName = "\(m_employee?.firstName ?? "") \(m_employee?.lastName ?? "")"
        
        let name = EmployeeProfilePresetable(key: "name".localized(), value: fullName)
        let email = EmployeeProfilePresetable(key: "email".localized(), value: "\(m_employee?.email ?? "")")

        let designation = EmployeeProfilePresetable(key: "designation".localized(), value: "\(m_employee?.jobtitle ?? "")")


        let fvrtColor = EmployeeProfilePresetable(key: "fvrtColor".localized(), value: "\(m_employee?.favouriteColor ?? "")")
        m_employeePresntableArray.append(name)
        m_employeePresntableArray.append(email)
        m_employeePresntableArray.append(designation)
        m_employeePresntableArray.append(fvrtColor)

    }

}

