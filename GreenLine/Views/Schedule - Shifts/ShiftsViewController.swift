//
//  ShiftsViewController.swift
//  GreenLine
//
//  Created by EAPPLE on 03/09/2022.
//

import UIKit

class ShiftsViewController: BaseViewController {

    @IBOutlet var shiftsView: ShiftsView!
    
    var isFromSchedule = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        shiftsView.setupViews(isFromSchedule)
        shiftsView.tableView.delegate = self
        shiftsView.tableView.dataSource = self
    }
    
    @IBAction
    func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

extension ShiftsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension ShiftsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ShiftsTableViewCell = tableView.dequeueCell(for: indexPath)
        return cell
    }
}

