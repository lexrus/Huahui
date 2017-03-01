//
//  WordCell.swift
//  Huahui
//
//  Created by Lex on 26/02/2017.
//  Copyright © 2017 lexrus.com. All rights reserved.
//

import UIKit

final class WordCell : UITableViewCell {

    static let id = "WordCell"

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureWithWord(_ word: Word, presentDanielJonesPhoneticSymbol: Bool) {
        textLabel?.text = word.origin

        if presentDanielJonesPhoneticSymbol {
            detailTextLabel?.text = "[\(word.UK)]"
        } else {
            detailTextLabel?.text = "[\(word.US)]"
        }
    }

}
