//
//  MoreViewController.swift
//  GreenLine
//
//  Created by EAPPLE on 03/09/2022.
//

import UIKit

class MoreViewController: BaseViewController {

    @IBOutlet var moreView: MoreView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func openTimesheetsViewController() {
        let vc = ShiftsViewController.instantiate(from: .Main)
        vc.isFromSchedule = true
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    private func openPayViewController() {
        let vc = PayViewController.instantiate(from: .Main)
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    private func openAbsencesViewController() {
        let vc = AbsencesViewController.instantiate(from: .Main)
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    private func logout() {
        SessionManager.shared.logout()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let navRootController = UINavigationController()
        navRootController.setNavigationBarHidden(true, animated: false)
        let vc = GetUserEmailViewController.instantiate(from: .Main)
        navRootController.pushViewController(vc, animated: true)
        appDelegate.window?.rootViewController = navRootController
        appDelegate.window?.makeKeyAndVisible()
    }
    
    @IBAction
    func moreButtonAction(_ sender: UIButton) {
        switch sender.tag {
            case 0:
                openTimesheetsViewController()
            case 1:
                openAbsencesViewController()
            case 3:
                openPayViewController()
            case 8:
                logout()
            default:
                break
        }
    }
}
