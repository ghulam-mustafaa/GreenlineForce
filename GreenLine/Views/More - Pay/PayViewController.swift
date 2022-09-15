//
//  PayViewController.swift
//  GreenLine
//
//  Created by EAPPLE on 08/09/2022.
//

import UIKit

class PayViewController: BaseViewController {

    @IBOutlet var payView: PayView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        payView.tableView.delegate = self
        payView.tableView.dataSource = self
    }
    

    @IBAction
    func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}

extension PayViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension PayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PayTableViewCell = tableView.dequeueCell(for: indexPath)
        cell.downloadIcon.isHidden = indexPath.row <= 4
        cell.downloadLabel.isHidden = indexPath.row <= 4
        cell.payLabel.isHidden = indexPath.row > 4
        return cell
    }
}
