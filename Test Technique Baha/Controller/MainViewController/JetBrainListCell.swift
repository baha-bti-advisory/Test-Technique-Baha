//
//  JetBrainListCell.swift
//  Test Technique Baha
//
//  Created by Bahaeddine Boulaabi on 06/12/2022.
//

import UIKit

class JetBrainListCell: UITableViewCell {

    // MARK: -- Outlets of the cell
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var forksLbl: UILabel!
    @IBOutlet weak var openIssuesLbl: UILabel!
    @IBOutlet weak var watchersLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // MARK: -- Apply shadow for the cell
        mainView.applyShadow(radius: 2, color: .black, opacity: 0.29)
        mainView.layer.cornerRadius = 15
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: -- Make space between the cell
    override func layoutSubviews() {
        super.layoutSubviews()
        let bottomSpace: CGFloat = 18.0 // Let's assume the space you want is 12
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: bottomSpace, right: 0))
    }

}
