//
//  AbsenceTableViewCell.swift
//  GreenLine
//
//  Created by EAPPLE on 04/10/2022.
//

import UIKit

class AbsenceTableViewCell: UITableViewCell {

    @IBOutlet weak var cellBGView: UIView!
    @IBOutlet weak var leaveIcon: UIImageView!
    @IBOutlet weak var leaveTypeLabel: UILabel!
    @IBOutlet weak var leaveDescriptionLabel: UILabel!
    @IBOutlet weak var leaveDateLabel: UILabel!
    @IBOutlet weak var leaveStatusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        cellBGView.setCornerRadius(10)
        cellBGView.setBorderColor(color: .textFieldBorderColor)
        cellBGView.setBorderWidth(width: 1)
    }
    
    func setupAbsenceData(_ absence: Absence) {
        leaveTypeLabel.text = absence.type
        leaveDescriptionLabel.text = absence.description
        leaveDateLabel.text = absence.date?.date?.birthdayString
        let status = AbsenceStatus(rawValue: absence.status ?? 1)
        leaveStatusLabel.text = status?.title
    }
}
