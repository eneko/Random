import Foundation
import Utility
import CommandRegistry
import Logger

class DiceCommand: Command {
    let command = "dice"
    let overview = "Throw one or multiple dice"

    private var number: OptionArgument<Int>

    required init(parser: ArgumentParser) {
        let subparser = parser.add(subparser: command, overview: overview)
        number = subparser.add(option: "--number", shortName: "-n", kind: Int.self, usage: "Number of dice to throw", completion: nil)
    }

    func run(with arguments: ArgumentParser.Result) throws {
        let number = arguments.get(self.number) ?? 1
        let dice = throwDice(number: number)
        Logger.standard.log(dice.map { "\($0)" })
    }

    func throwDice(number: Int) -> [Int] {
        return (1...number).map { _ in
            Int.random(in: 1...6)
        }
    }

}
