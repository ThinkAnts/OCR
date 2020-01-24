//
//  DetailsViewController.swift
//  Prescription Reader
//
//  Created by Hemang Shah on 13/12/19.
//  Copyright © 2019 Ravi kishore. All rights reserved.
//

import UIKit

extension UIButton {
    func config() {
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15.0, weight: .semibold)
        self.setTitleColor(UIColor.white, for: .normal)
        self.backgroundColor = UIColor.blue.withAlphaComponent(0.6)
    }
}

extension UITableView {
    func config() {
        self.tableFooterView = UIView()
    }
}

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var tableViewDetails: UITableView!
    @IBOutlet weak var btnSetReminders: UIButton!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    //MARK:- Config UI
    func configUI() {
        tableViewDetails.config()
        btnSetReminders.config()
    }
}

extension DetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PrescriptionTableViewCell", for: indexPath) as? PrescriptionTableViewCell else { return UITableViewCell() }
        return cell
    }
}
