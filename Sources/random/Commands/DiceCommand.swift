import Foundation
import Utility
import CommandRegistry
import Logger

class DiceCommand: Command, NumberOptionable {
    let command = "dice"
    let overview = "Throw one or multiple dice"
    let subparser: ArgumentParser
    var subcommands: [Command] = []

    let number: OptionArgument<Int>

    required init(parser: ArgumentParser) {
        subparser = parser.add(subparser: command, overview: overview)
        number = subparser.addNumberArgument(usage: "Number of dice to throw")
    }

    func run(with arguments: ArgumentParser.Result) throws {
        let number = arguments.get(self.number) ?? 1
        let options = Array(1...6)
        let dice = Randomizer().pick(options: options, times: number)
        Logger.standard.log(dice.map { "\($0)" })
    }

}
