//
//  WordListHeader.swift
//  Huahui
//
//  Created by Lex on 28/02/2017.
//  Copyright © 2017 lexrus.com. All rights reserved.
//

import UIKit

final class WordListHeader : UIView {

    let countrySegment = UISegmentedControl(items: ["en_US", "en_GB"])

    init () {
        super.init(frame: CGRect.zero)

        addSubview(countrySegment)

        let fontAttr = [ NSFontAttributeName: UIFont.systemFont(ofSize: 18) ]
        countrySegment.setTitleTextAttributes(fontAttr, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        countrySegment.sizeToFit()
        countrySegment.frame.origin.x = (bounds.width - countrySegment.bounds.width) / 2
        countrySegment.frame.origin.y = (bounds.height - countrySegment.bounds.height) / 2
    }

}
