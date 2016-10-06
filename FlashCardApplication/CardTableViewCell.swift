//
//  CardTableViewCell.swift
//  FlashCardApplication
//
//  Created by Scott Kornblatt on 9/30/16.
//  Copyright © 2016 Scott Kornblatt. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func useCard() {
        
        mainView.layer.cornerRadius = 10
        mainView.layer.masksToBounds = true
        
        questionLabel.textColor = UIColor.darkGray
    }
    
    func getResult() {
        let expression = NSExpression(format: questionLabel.text!)
        questionLabel.text = expression.expressionValue(with: nil, context: nil) as! String?
    }
}
