//
//  AbsencesViewController.swift
//  GreenLine
//
//  Created by EAPPLE on 08/09/2022.
//

import UIKit

class AbsencesViewController: UIViewController {

    @IBOutlet var absencesView: AbsencesView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction
    func addButtonAction(_ sender: UIButton) {
    }
    
    @IBAction
    func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
