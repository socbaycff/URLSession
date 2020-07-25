//
//  SearchResult.swift
//  URLSession
//
//  Created by L Khang on 7/25/20.
//  Copyright © 2020 L Khang. All rights reserved.
//

import Foundation

class SearchResult: Codable {
  
    var list: [Word]
}
class Word: Codable {
      var definition: String
  }
