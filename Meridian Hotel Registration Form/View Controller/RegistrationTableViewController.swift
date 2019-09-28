//
//  RegistrationTableViewController.swift
//  Meridian Hotel Registration Form
//
//  Created by Aleksey Popov on 28/09/2019.
//  Copyright © 2019 Aleksey Popov. All rights reserved.
//

import UIKit

class RegistrationTableViewController: UITableViewController {
    
    // MARK: - ... @IBOutlet
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var chekInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    @IBOutlet weak var numbersOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    @IBOutlet weak var wifiSwitch: UISwitch!
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    // MARK:  - ... Properties
    let chekInLabelIndexPath = IndexPath (row: 0, section: 1)
    let chekInPickerIndexPath = IndexPath (row: 1, section: 1)
    let chekOutLabelIndexPath = IndexPath (row: 2, section: 1)
    let chekOutPickerIndexPath = IndexPath (row: 3, section: 1)
    
    var isChekInPickerShown: Bool = false {
        didSet {
            chekInDatePicker.isHidden = !isChekInPickerShown
        }
    }
    var isCheckOutPickerShown: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutPickerShown
        }
    }
    
    var roomType: RoomType? {
        didSet {
            roomTypeLabel.text = roomType?.name
        }
    }
    
    // MARK: - ... UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        let midnightToday = Calendar.current.startOfDay(for: Date())
        chekInDatePicker.minimumDate = midnightToday
        chekInDatePicker.date = midnightToday
        
        updateDateViews()
        updateNumberOfGuest ()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard roomType == roomType else {return}
        guard segue.identifier == "RoomSelectedSegue" else {return}
        let controller = segue.destination as! RoomSelectionTableViewController
        controller.selectedRoomType = roomType
    }
    // MARK: - ... Methods
    func updateDateViews () {
        checkOutDatePicker.minimumDate = chekInDatePicker.date.addingTimeInterval(60*60*24)
        let dateFormatter = DateFormatter ()
        dateFormatter.dateStyle = .medium
        
        checkInDateLabel.text = dateFormatter.string(from: chekInDatePicker.date)
        checkOutDateLabel.text = dateFormatter.string(from: checkOutDatePicker.date)
    }
    
    func updateNumberOfGuest () {
        numbersOfAdultsLabel.text = " \(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    // MARK: ... - @IBAction
    @IBAction func doneBarButton(_ sender: UIBarButtonItem) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let emailAddress = emailAddressTextField.text ?? ""
        let checkinDate = chekInDatePicker.date.addingTimeInterval(60*60*3)
        let checkOutDate = checkOutDatePicker.date.addingTimeInterval(60*60*3)
        
        let numberofAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let wifi=wifiSwitch.isOn
        guard let roomType = roomType else {return}
        
        let registration = Registration (
            firstName: firstName,
            lastName: lastName,
            emailAddress: emailAddress,
            checkInDate: checkinDate,
            checkOutDate: checkOutDate,
            numberOfAdults: numberofAdults,
            numberOfChildren: numberOfChildren,
            wifi: wifi,
            roomType: roomType
            )
        
        print (#function, registration)
    }
    
    @IBAction func datePickerchanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
    @IBAction func stepperValueChanched (_ sender: UIStepper) {
        updateNumberOfGuest ()
    }
    

    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard segue.identifier == "SaveRoomSegue" else {return}
        
        let controller = segue.source as! RoomSelectionTableViewController
        roomType = controller.selectedRoomType
        
    }
}
extension RegistrationTableViewController /* UITableViewDelegate*/{
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath {
        
        case chekInLabelIndexPath:
            isChekInPickerShown.toggle()
        case chekOutLabelIndexPath:
            isCheckOutPickerShown.toggle()
        default:
            return
        }
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case chekInPickerIndexPath:
            return isChekInPickerShown ? 216 : 0
        case chekOutPickerIndexPath:
            return isCheckOutPickerShown ? 216:0
        default:
            return 44
        }
    }
    
}

