//
//  Order.swift
//  App
//
//  Created by Amitesh Nagarkar on 02/05/2020.
//

import Foundation
import Vapor
import FluentSQLite

struct Order: Content, SQLiteModel, Migration {
    var id: Int?
    var cakeName: String
    var buyerName: String
    var date: Date?
    typealias Database = SQLiteDatabase
}
