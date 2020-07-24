//
//  Fact.swift
//  URLSession
//
//  Created by L Khang on 7/23/20.
//  Copyright © 2020 L Khang. All rights reserved.
//

import Foundation
class Fact: Codable, CustomStringConvertible {
    var description: String {
       return  """
        Số: \(number ?? 0)
        Fact: \(text ?? "😜")

        """
    }
    
   // var found: Bool?
    var number: Int?
    var text: String?
    var type: String?

}
