//
//  SeeMoreTableViewCell.swift
//  SeeMorePoc
//
//  Created by Rahul Verma on 09/05/23.
//

import UIKit

class SeeMoreTableViewCell: UITableViewCell {

    @IBOutlet weak var seeMoreView: SeeMoreView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension SeeMoreTableViewCell{

    // MARK: Configure Cell
    func configureCell(with data: String, isExpanded: Bool, index: Int){
        seeMoreView.setText(text: data, isExpanded: isExpanded, index: index)
        seeMoreView.layoutIfNeeded()
    }
}


