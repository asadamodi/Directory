//
//  Constants.swift
//  VMDirectory
//
//  Created by Asad on 17/11/22.
//

import Foundation
import UIKit



//let baseURL = "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/"


var baseURL: String {
#if VMDirectory_DEV
    return "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/"
#elseif VMDirectory_QA
    return "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/"
#else
    return "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/"
#endif
}
let roomsURL = "\(baseURL)rooms"
let peopleURL = "\(baseURL)people"


let c_textColor = UIColor(red: 196/255, green: 2/255, blue: 2/255, alpha: 1.0)
