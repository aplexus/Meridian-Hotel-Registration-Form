//
//  RoomType.swift
//  Meridian Hotel Registration Form
//
//  Created by Aleksey Popov on 28/09/2019.
//  Copyright © 2019 Aleksey Popov. All rights reserved.
//

struct RoomType {
    var id: Int
    var name: String
    var shortName: String
    var price: Int
    
    
    static var all: [RoomType] {
        return [
        RoomType (id: 0, name: "Two Queens", shortName: "2Q", price: 179),
        RoomType (id: 1, name: "King Bed", shortName: "K", price: 209),
        RoomType (id: 2, name: "Penthouse Suite", shortName: "PHS", price: 309)]
    }
}

extension RoomType: Equatable {
    static func == (left: RoomType, right: RoomType) -> Bool {
        return left.id == right.id
    }
}
