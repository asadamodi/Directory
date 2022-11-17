//
//  EmployeeProfileTableViewCell.swift
//  VMDirectory
//
//  Created by Asad on 17/11/22.
//

import UIKit

class EmployeeProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var m_keyLabel: UILabel!
    
    @IBOutlet weak var m_valueTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
