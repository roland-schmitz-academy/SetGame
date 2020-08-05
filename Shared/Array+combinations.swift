//
//  Array+combinations.swift
//  SetGame
//
//  Created by Roland Schmitz on 05.08.20.
//

import Foundation

extension Array {
    func combinations(ofLength length: Int) -> Array<Array<Element>> {
        ArraySlice(self).combinations(ofLength: length)
    }
}

extension ArraySlice {
    func combinations(ofLength length: Int) -> Array<Array<Element>> {
        if length == 1 {
            return self.map { element in [element] }
        } else {
            return self.indices.flatMap { index in
                self[index.advanced(by: 1)...].combinations(ofLength: length - 1).map { subCombination in
                    [self[index]] + subCombination
                }
            }
        }
    }
}
