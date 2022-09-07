//
//  ChooseYourTeamView.swift
//  GreenLine
//
//  Created by BrainX Technologies IOS 4 on 31/07/2022.
//

import UIKit

class ChooseYourTeamView: UIView {

    @IBOutlet weak var loginBGView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nextButton.setCornerRadius(16)
    }
    
}
