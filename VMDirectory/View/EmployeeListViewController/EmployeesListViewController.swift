//
//  EmployeesListViewController.swift
//  VMDirectory
//
//  Created by Asad on 16/11/22.
//

import UIKit
import SDWebImage
class EmployeesListViewController: UIViewController {
    
    let m_viewModel = EmployeesListViewModel()
    var m_dataIsLoaded = false
    let refreshControl = UIRefreshControl()
    let m_reuseIdentifier = "EmployeeListTableViewCell"
    
    @IBOutlet weak var m_tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        m_viewModel.delegate = self
        m_tableView.register(UINib(nibName: m_reuseIdentifier, bundle: nil), forCellReuseIdentifier: m_reuseIdentifier)
        refreshControl.attributedTitle = NSAttributedString(string: "pullToRefresh".localized())
        refreshControl.addTarget(self, action: #selector(fetchEmployeesList), for: .valueChanged)
        m_tableView.addSubview(refreshControl)
        self.title = "employees".localized();
    }
    
    
    @objc func fetchEmployeesList(){
        showHUD(message: "pleaseWait".localized())
        m_viewModel.fetchEmployeeList()
    }
    override func viewDidAppear(_ animated: Bool) {
        if(!m_dataIsLoaded){
            fetchEmployeesList()
        }
    }
    private func gotoEmployeeProfile(employee:EmployeesListElement) {
        let employeeProfileViewController = EmployeeProfileViewController()
        employeeProfileViewController.m_viewModel.m_employee = employee
        navigationController?.pushViewController(employeeProfileViewController, animated: true)
        
    }
}


extension EmployeesListViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        m_viewModel.m_employeeArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: m_reuseIdentifier, for: indexPath) as! EmployeeListTableViewCell
        if let employee = m_viewModel.m_employeeArray?[indexPath.row]{
            cell.accessoryType = .disclosureIndicator
            cell.m_employeeImageView.setRadius()
            cell.m_employeeFullNameLabel.text = "\(employee.firstName ?? "") \(employee.lastName ?? "")"
            if let imageURL = URL(string: "\(employee.avatar ?? "")"){
                cell.m_employeeImageView.sd_setImage(with: imageURL, completed: nil)
                
            }
            cell.m_employeeFullNameLabel.textColor = c_textColor
        }
        return cell
    }
    
    
}
extension EmployeesListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let employee = m_viewModel.m_employeeArray?[indexPath.row]{
            gotoEmployeeProfile(employee: employee)
        }
    }
}
extension EmployeesListViewController:DirectoryWebResponseProtocol{
    func fetchTaskFinished(withError: Bool) {
        
        DispatchQueue.main.async { [unowned self]in
            self.m_dataIsLoaded = true
            refreshControl.endRefreshing()
            hideHUD()
            self.m_tableView.reloadData()
            if(withError){
                displayActivityAlert(title: "somethingWentWrong".localized())
            }
            
        }
    }
    
    
    
}
