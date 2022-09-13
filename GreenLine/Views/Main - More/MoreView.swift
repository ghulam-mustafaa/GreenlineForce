//
//  MoreView.swift
//  GreenLine
//
//  Created by EAPPLE on 03/09/2022.
//

import UIKit

class MoreView: UIView {

    @IBOutlet weak var moreBGView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollContentView: UIView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var timesheetStackView: UIStackView!
    @IBOutlet weak var timesheetsView: UIView!
    @IBOutlet weak var absencesView: UIView!
    @IBOutlet weak var availabilityView: UIView!
    @IBOutlet weak var payView: UIView!
    @IBOutlet weak var settingsStackView: UIStackView!
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var supportView: UIView!
    @IBOutlet weak var contactsView: UIView!
    @IBOutlet weak var resynchView: UIView!
    @IBOutlet weak var logoutView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userAcronymLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupProfileData()
        [timesheetStackView, settingsStackView, contactsView, resynchView].forEach({
            $0?.setBorderWidth(width: 1)
            $0?.setBorderColor(color: .textFieldBorderColor)
        })
    }
    
    func setupProfileData() {
        let firstName = SessionManager.shared.user?.firstName ?? "Greenline"
        let lastName = SessionManager.shared.user?.lastName ?? "User"
        userNameLabel.text = SessionManager.shared.user?.name?.capitalized ?? "Greenline User"
        userAcronymLabel.text = "\(firstName.first?.uppercased() ?? "G")\(lastName.first?.uppercased() ?? "U")"
    }
}
