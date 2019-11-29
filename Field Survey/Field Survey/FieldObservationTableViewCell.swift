//
//  FieldObservationTableViewCell.swift
//  Field Survey
//
//  Created by Travis Agne on 11/29/19.
//  Copyright © 2019 Travis Agne. All rights reserved.
//

import UIKit

class FieldObservationTableViewCell: UITableViewCell {
    @IBOutlet weak var observationIconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
