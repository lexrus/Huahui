//
//  Word.swift
//  Huahui
//
//  Created by Lex on 26/02/2017.
//  Copyright © 2017 lexrus.com. All rights reserved.
//

import Foundation

struct Word {

    let UK: String
    let US: String
    let origin: String

    init(_ origin: String, US: String, UK: String) {
        self.origin = origin
        self.US = US
        self.UK = UK
    }
    
}
