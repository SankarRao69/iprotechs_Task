//
//  OrdersTableViewCell.swift
//  iprotechs_Task
//
//  Created by SANKAR on 19/03/21.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var OrderNumberLabel: UILabel!
    @IBOutlet weak var OrderDueDateLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var buyerNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var orderImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bgView.layer.cornerRadius  = 8
        self.bgView.layer.borderWidth   = 0.5
        self.bgView.layer.borderColor = UIColor.lightText.cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
