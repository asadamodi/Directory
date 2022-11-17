//
//  EmployeeListTableViewCell.swift
//  VMDirectory
//
//  Created by Asad on 17/11/22.
//

import UIKit

class EmployeeListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var m_employeeImageView: UIImageView!
    
    @IBOutlet weak var m_employeeFullNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
