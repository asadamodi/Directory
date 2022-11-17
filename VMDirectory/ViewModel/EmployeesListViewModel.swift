//
//  EmployeesListViewModel.swift
//  VMDirectory
//
//  Created by Asad on 17/11/22.
//

import UIKit

class EmployeesListViewModel: NSObject {
    weak var delegate:DirectoryWebResponseProtocol?
    var m_employeeArray : EmployeesList?

    func fetchEmployeeList()
    {
        WebserviceManager.sharedInstance.executeGetRequest(url: peopleURL) {[unowned self] data, response, error, status in
            if let data = data{
                self.m_employeeArray = convertDataToModel(data, type: EmployeesList.self)
            }
            self.delegate?.fetchTaskFinished(withError: !status)
        }
    }

}
