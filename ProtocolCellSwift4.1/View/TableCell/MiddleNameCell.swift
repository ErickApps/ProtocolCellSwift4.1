//
//  MiddleNameCell.swift
//  ProtocolCellsSwift4.2
//
//  Created by Erick Barbosa on 6/16/18.
//  Copyright © 2018 Erick Barbosa. All rights reserved.
//


import UIKit

class MiddleNameCell: UITableViewCell, ConfigureCellProtocol {
  @IBOutlet weak var middleNameLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func configureCell<T>(data: T) {
    guard let user = data as? User else { return }
    middleNameLabel.text = user.middleName
  }
}
