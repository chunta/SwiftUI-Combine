//
//  PersonModel.swift
//  MainApp
//
//  Created by Rex Chen on 2021/6/6.
//

import Foundation

struct Person: Hashable {
    let name: String
    
    // MARK: Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
