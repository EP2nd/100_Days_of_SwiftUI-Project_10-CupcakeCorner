//
//  File.swift
//  CupcakeCorner
//
//  Created by Edwin Przeźwiecki Jr. on 25/01/2023.
//

import Foundation

extension String {
    var isTrulyEmpty: Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
