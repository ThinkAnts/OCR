//
//  PrescriptionTableViewCell.swift
//  Prescription Reader
//
//  Created by Hemang Shah on 13/12/19.
//  Copyright © 2019 Ravi kishore. All rights reserved.
//

import UIKit

class PrescriptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelMedicineName: UILabel!
    @IBOutlet weak var collectionViewTime: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionViewTime.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
