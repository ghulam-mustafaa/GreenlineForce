//
//  ProfileViewController.swift
//  GreenLine
//
//  Created by EAPPLE on 10/09/2022.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var profileView: ProfileView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileView.setupProfileData()
    }
    
    @IBAction
    func crossButtonAction(_ sender: UIButton) {
        profileView.hideEditView(true)
    }
    
    @IBAction
    func editButtonAction(_ sender: UIButton) {
        profileView.hideEditView(false)
    }
    
    @IBAction
    func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction
    func selectGenderButtonAction(_ sender: UIButton) {
    }
    
    @IBAction
    func updateButtonAction(_ sender: UIButton) {
    }
}
