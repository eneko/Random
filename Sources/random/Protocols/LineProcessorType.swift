//
//  LineProcessorType.swift
//  random
//
//  Created by Eneko Alonso on 9/16/18.
//

import Foundation

protocol LineProcessorType {}

extension LineProcessorType {
    func splitWords(string: String) -> [String] {
        return string.components(separatedBy: " ")
    }

    func splitCharacters(string: String) -> [String] {
        return string.components(separatedBy: "")
    }

    func splitFirstLineIfNeeded(lines: [String]) -> [String] {
        if lines.count == 1 {
            return splitWords(string: lines[0])
        }
        return lines
    }

    func splitWordIfNeeded(words: [String]) -> [String] {
        if words.count == 1 {
            return splitCharacters(string: words[0])
        }
        return words
    }
}
