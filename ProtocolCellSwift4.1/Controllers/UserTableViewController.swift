//
//  UserTableViewController.swift
//  ProtocolCellsSwift4.2
//
//  Created by Erick Barbosa on 6/16/18.
//  Copyright © 2018 Erick Barbosa. All rights reserved.
//

import UIKit

enum CellIdentifier: Int {
    case firstName
    case middleName
    case lastName
    
    var identifier: String {
        switch self {
        case .firstName:
            return "FirstNameCell"
        case .middleName:
            return "MiddleNameCell"
        case .lastName:
            return "LastNameCell"
        }
    }
}

class UserTableViewController: UITableViewController {
    let user: [User] = [User.init(),User.init(),User.init()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return user.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = CellIdentifier(rawValue: indexPath.row)?.identifier ?? ""
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        if let cellProtocol = cell as? ConfigureCellProtocol {
            cellProtocol.configureCell(data: user[indexPath.row])
        }
        return cell
    }
}
extension UserTableViewController: CellDelegate {
    func tapped() {
        print("delegate tapped")
    }
}
