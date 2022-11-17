//
//  RoomsListModel.swift
//  VMDirectory
//
//  Created by Asad on 17/11/22.
//

import Foundation


// MARK: - Room
typealias Rooms = [Room]

struct Room: Codable {
    let createdAt: String?
    let isOccupied: Bool?
    let maxOccupancy: Int?
    let id: String?
}

protocol DirectoryWebResponseProtocol:AnyObject
{
    func fetchTaskFinished(withError:Bool)
}
