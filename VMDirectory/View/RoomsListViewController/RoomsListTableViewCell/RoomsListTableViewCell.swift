//
//  RoomsListTableViewCell.swift
//  VMDirectory
//
//  Created by Asad on 17/11/22.
//

import UIKit

class RoomsListTableViewCell: UITableViewCell {

    @IBOutlet weak var m_roomNameLabel: UILabel!
    
    @IBOutlet weak var m_maxOccupancyLabel: UILabel!
    
    @IBOutlet weak var m_isOccupied: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(room:Room) {
//        condition ? true_expression : false_expression

        m_roomNameLabel.text = "\("room".localized()) : \(room.id ?? "")"
        m_isOccupied.text = "Status : \(room.isOccupied ?? false ? "occupied".localized() : "free".localized())"
        m_maxOccupancyLabel.text =  "\("maxOccupancy".localized()) : \(room.maxOccupancy ?? 0)"
        
//        m_roomNameLabel.textColor = c_textColor
//        m_isOccupied.textColor = c_textColor
//        m_maxOccupancyLabel.textColor = c_textColor

    }
    
}
