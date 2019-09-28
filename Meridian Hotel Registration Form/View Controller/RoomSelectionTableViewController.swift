//
//  RoomSelectionTableViewController.swift
//  Meridian Hotel Registration Form
//
//  Created by Aleksey Popov on 28/09/2019.
//  Copyright © 2019 Aleksey Popov. All rights reserved.
//

import UIKit

class RoomSelectionTableViewController: UITableViewController {
    
    // MARK : - Properties
    var selectedRoomType: RoomType?
     
    // MARK: - ... UITableDataSource Protocol
    override func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
            return RoomType.all.count
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomSelectionCell")!
        let row = indexPath.row
        let roomType = RoomType.all[row]
        
        configure(cell: cell, with: roomType)
        return cell
    }
    
    //MARK: - ... UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        selectedRoomType = RoomType.all[row]
        tableView.reloadData()
    }
    
    // MARK: - ... Methods
    func configure (cell: UITableViewCell, with roomType: RoomType) {
        cell.textLabel?.text = roomType.name
        cell.detailTextLabel?.text = "$\(roomType.price)"
        
        guard let selectedRoomType = selectedRoomType else {return}
        cell.accessoryType = roomType  == selectedRoomType ? .checkmark : .none
    }
}


