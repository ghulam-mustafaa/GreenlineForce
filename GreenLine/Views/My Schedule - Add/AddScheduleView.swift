//
//  AddScheduleView.swift
//  GreenLine
//
//  Created by EAPPLE on 08/09/2022.
//

import UIKit

class AddScheduleView: UIView {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var calendarLabel: CalendarView!
    @IBOutlet weak var scheduleBGView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollContentView: UIView!
    @IBOutlet weak var absenceTypeBGView: UIView!
    @IBOutlet weak var absenceTypeExpandIcon: UIImageView!
    @IBOutlet weak var absenceTypeLabel: UILabel!
    @IBOutlet weak var selectDatesBGView: UIView!
    @IBOutlet weak var fromIcon: UIImageView!
    @IBOutlet weak var fromDateLabel: UILabel!
    @IBOutlet weak var selectFromButton: UIButton!
    @IBOutlet weak var toIcon: UIImageView!
    @IBOutlet weak var selectToButton: UIButton!
    @IBOutlet weak var toDateLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalCountLabel: UILabel!
    @IBOutlet weak var timeZoneLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var commentBGView: UIView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var approveBGView: UIView!
    @IBOutlet weak var approveLabel: UILabel!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var currentMonthLabel: UILabel!
    @IBOutlet weak var progressEmptyView: UIView!
    @IBOutlet weak var progressBGView: UIView!
    @IBOutlet weak var infoIcon: UIImageView!
    @IBOutlet weak var holidayCountLabel: UILabel!
    @IBOutlet weak var currentHolidayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        [approveBGView, commentBGView, absenceTypeBGView, selectDatesBGView].forEach({
            $0?.setBorderColor(color: .textFieldBorderColor)
            $0?.setBorderWidth(width: 1)
        })
    }

}
