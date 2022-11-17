//
//  EmployeeProfileViewController.swift
//  VMDirectory
//
//  Created by Asad on 17/11/22.
//

import UIKit

class EmployeeProfileViewController: UIViewController {

    let m_viewModel = EmployeeProfileViewModel()
    @IBOutlet weak var m_employeeImageView: UIImageView!
    
    @IBOutlet weak var m_tableView: UITableView!
    let m_reuseIdentifier = "EmployeeProfileTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        m_tableView.register(UINib(nibName: m_reuseIdentifier, bundle: nil), forCellReuseIdentifier: m_reuseIdentifier)
        m_viewModel.prepareDataToDisplay()
        m_employeeImageView.setRadius()
    }
    override func viewDidAppear(_ animated: Bool) {
        
        if let imageURL = URL(string: "\(m_viewModel.m_employee?.avatar ?? "")"){
            m_employeeImageView.sd_setImage(with: imageURL, completed: nil)

        }
        m_tableView.reloadData()
    }

    
    

}
extension EmployeeProfileViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension EmployeeProfileViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // m_viewModel.m_employeeArray?.count ?? 0
        m_viewModel.m_employeePresntableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: m_reuseIdentifier, for: indexPath) as! EmployeeProfileTableViewCell
//        if let employee = m_viewModel.m_employeeArray?[indexPath.row]{
//
//        }
        let presentable = m_viewModel.m_employeePresntableArray[indexPath.row]
        cell.m_keyLabel.text = presentable.key
        cell.m_valueTextView.text = presentable.value
        
        cell.m_keyLabel.textColor = .darkGray
//        cell.m_valueTextView.textColor = c_textColor
        return cell
    }
    
    
}


