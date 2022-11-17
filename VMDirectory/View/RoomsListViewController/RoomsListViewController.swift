//
//  RoomsListViewController.swift
//  VMDirectory
//
//  Created by Asad on 16/11/22.
//

import UIKit

class RoomsListViewController: UIViewController {

    let m_viewModel = RoomsListViewModel()
    var m_dataIsLoaded = false
    let refreshControl = UIRefreshControl()
    let m_reuseIdentifier = "RoomsListTableViewCell"

    @IBOutlet weak var m_tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        m_viewModel.delegate = self
        // Do any additional setup after loading the view.
        m_viewModel.delegate = self
        m_tableView.register(UINib(nibName: m_reuseIdentifier, bundle: nil), forCellReuseIdentifier: m_reuseIdentifier)
        refreshControl.attributedTitle = NSAttributedString(string: "pullToRefresh".localized())
        refreshControl.addTarget(self, action: #selector(fetchRooms), for: .valueChanged)
        m_tableView.addSubview(refreshControl)
        self.title = "rooms".localized();

    }
    @objc func fetchRooms(){
        showHUD(message: "pleaseWait".localized())
        m_viewModel.fetchRooms()
    }
    override func viewDidAppear(_ animated: Bool) {
        if(!m_dataIsLoaded){
            fetchRooms()
        }
    }

}

extension RoomsListViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        m_viewModel.m_roomsArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: m_reuseIdentifier, for: indexPath) as! RoomsListTableViewCell
        if let room = m_viewModel.m_roomsArray?[indexPath.row]{
            cell.setData(room: room)
        }
        return cell
    }
    
    
}

extension RoomsListViewController:DirectoryWebResponseProtocol{
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
