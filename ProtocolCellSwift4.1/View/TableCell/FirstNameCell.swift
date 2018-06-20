//
//  FirstNameCell.swift
//  ProtocolCellsSwift4.2
//
//  Created by Erick Barbosa on 6/16/18.
//  Copyright © 2018 Erick Barbosa. All rights reserved.
//

import UIKit

protocol CellDelegate {
  func tapped()
}

protocol ConfigureCellProtocol {
  func configureCell<T>(data: T)
}

class FirstNameCell: UITableViewCell, ConfigureCellProtocol {
  @IBOutlet weak var firstNameLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
    tap.delegate = self
    addGestureRecognizer(tap)
  }

  @objc func handleTap() {
    let delegate: CellDelegate = UserTableViewController()
    delegate.tapped()
  }

  func configureCell<T>(data: T) {
    guard let user = data as? User else { return }
    firstNameLabel.text = user.firstName
  }
}
