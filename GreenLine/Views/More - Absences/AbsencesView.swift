//
//  AbsencesView.swift
//  GreenLine
//
//  Created by EAPPLE on 08/09/2022.
//

import UIKit

class AbsencesView: UIView {

    @IBOutlet weak var absenceBGView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var noAbsencesLabel: UILabel!
    @IBOutlet weak var noAbsencesView: UIView!
    @IBOutlet weak var absenceTypeStackView: UIStackView!
    @IBOutlet weak var dateRangeLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var absenceDateView: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var allowedBGView: UIView!
    @IBOutlet weak var allowedLabel: UILabel!
    @IBOutlet weak var usedBGView: UIView!
    @IBOutlet weak var allowedCountLabel: UILabel!
    @IBOutlet weak var usedLabel: UILabel!
    @IBOutlet weak var usedCountLabel: UILabel!
    @IBOutlet weak var bookedBGView: UIView!
    @IBOutlet weak var bookedLabel: UILabel!
    @IBOutlet weak var bookedCountLabel: UILabel!
    @IBOutlet weak var requestedBGView: UIView!
    @IBOutlet weak var requestedLabel: UILabel!
    @IBOutlet weak var requestedCountLabel: UILabel!
    @IBOutlet weak var leftBGView: UIView!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var leftCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        absenceTypeStackView.setBorderColor(color: .textFieldBorderColor)
        absenceTypeStackView.setBorderWidth(width: 1)
        addButton.setBorderWidth(width: 1)
        addButton.setBorderColor(color: UIColor(0x8CB03E))
    }
    
    func setAbsenceQuotaView(_ quota: AbsenceQuota?) {
        guard let quota = quota else {
            return
        }
        allowedCountLabel.text = "\(quota.totalCount ?? 0) days"
        usedCountLabel.text = "\(quota.used ?? 0) days"
        bookedCountLabel.text = "\(quota.approved ?? 0) days"
        requestedCountLabel.text = "\(quota.requested ?? 0) days"
        leftCountLabel.text = "\(quota.remaining ?? 0) days"
    }
    
}
