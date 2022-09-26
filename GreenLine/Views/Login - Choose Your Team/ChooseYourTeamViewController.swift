//
//  ChooseYourTeamViewController.swift
//  GreenLine
//
//  Created by BrainX Technologies IOS 4 on 31/07/2022.
//

import UIKit

class ChooseYourTeamViewController: BaseViewController {

    @IBOutlet var loginView: ChooseYourTeamView!
    
    var email = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginView.tableView.delegate = self
        loginView.tableView.dataSource = self
    }
    
    @IBAction
    func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction
    func nextButtonAction(_ sender: UIButton) {
        let vc = EnterPasswordViewController.instantiate(from: .Main)
        vc.viewModel.email = email
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ChooseYourTeamViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension ChooseYourTeamViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ChooseYourTeamTableViewCell = tableView.dequeueCell(for: indexPath)
        return cell
    }
}
