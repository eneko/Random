//
//  NumberOptionable.swift
//  random
//
//  Created by Eneko Alonso on 9/16/18.
//

import Foundation
import Utility

protocol NumberOptionable {
    var number: OptionArgument<Int> { get }
}

extension ArgumentParser {
    func addNumberArgument(usage: String) -> OptionArgument<Int> {
        return add(option: "--number", shortName: "-n", kind: Int.self, usage: usage)
    }
}
