//
//  HomeViewController.swift
//  VMDirectory
//
//  Created by Asad on 16/11/22.
//

import UIKit
import Localize_Swift
class HomeViewController: UIViewController {

    @IBOutlet weak var m_tableView: UITableView!
    let m_reuseIdentifier = "HomeTableViewCell"
    let m_menuItemsArray = ["rooms".localized(),"employees".localized()]
    override func viewDidLoad() {
        super.viewDidLoad()
        m_tableView.register(UITableViewCell.self, forCellReuseIdentifier: m_reuseIdentifier)
        title = "VMDirectory".localized()
                // Do any additional setup after loading the view.
        
        #if VMDirectory_DEV
        print("VMDirectory_DEV")
        #elseif VMDirectory_QA
        print("VMDirectory_QA")

        #else
        print("VMDirectory")
        #endif
    }
    private func gotoRoomsList() {
        navigationController?.pushViewController(RoomsListViewController(), animated: true)
    }
    private func gotoEmployeesList() {
        navigationController?.pushViewController(EmployeesListViewController(), animated: true)

    }

}
extension HomeViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if(indexPath.row == 0) {
            gotoRoomsList()
        }
        else if (indexPath.row == 1) {
            gotoEmployeesList()
        }
    }
    
}

extension HomeViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return m_menuItemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: m_reuseIdentifier, for: indexPath) //as! UITableViewCell
        
        cell.textLabel?.text = m_menuItemsArray[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.textColor = c_textColor
        return cell
    }
    
    
}
