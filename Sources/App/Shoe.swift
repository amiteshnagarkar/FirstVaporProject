//
//  Shoe.swift
//  App
//
//  Created by Amitesh Nagarkar on 01/05/2020.
//

import Foundation
import Vapor

struct Shoe: Content{
    var id: Int
    var name: String
    var description: String
    var price: Int
}
