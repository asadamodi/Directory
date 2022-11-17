//
//  RoomsListViewModel.swift
//  VMDirectory
//
//  Created by Asad on 17/11/22.
//

import UIKit

class RoomsListViewModel: NSObject {
    
    weak var delegate:DirectoryWebResponseProtocol?
    var m_roomsArray : Rooms?

    func fetchRooms()
    {
        WebserviceManager.sharedInstance.executeGetRequest(url: roomsURL) {[unowned self] data, response, error, status in
            if let data = data{
                self.m_roomsArray = convertDataToModel(data, type: Rooms.self)
            }
            self.delegate?.fetchTaskFinished(withError: !status)
        }
    }

}
