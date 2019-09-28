//
//  Registration.swift
//  Meridian Hotel Registration Form
//
//  Created by Aleksey Popov on 28/09/2019.
//  Copyright © 2019 Aleksey Popov. All rights reserved.
//

import Foundation

struct Registration {
    var firstName: String
    var lastName: String
    var emailAddress: String
    
    var checkInDate: Date
    var checkOutDate: Date
    
    var numberOfAdults: Int
    var numberOfChildren: Int
    
    var wifi: Bool
    
    var roomType: RoomType
    
    init (firstName: String = "",
          lastName: String = "",
          emailAddress: String = "",
          checkInDate: Date = Date(),
          checkOutDate: Date = Date(),
          
          numberOfAdults: Int = Int (),
          numberOfChildren: Int = Int(),
          wifi: Bool = Bool (),
        
          roomType: RoomType = RoomType (
            id: Int(),
            name: String(),
            shortName: String(),
            price: Int()
          )
    ){
        self.firstName = firstName
        self.lastName = lastName
        self.emailAddress = emailAddress
        self.checkInDate = checkInDate
        self.checkOutDate = checkOutDate
        self.numberOfAdults = numberOfAdults
        self.numberOfChildren = numberOfChildren
        self.wifi = wifi
        self.roomType = roomType
    }
}
