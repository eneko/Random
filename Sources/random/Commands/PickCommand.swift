import Foundation
import Utility
import CommandRegistry
import Logger

class PickCommand: Command, LineProcessorType, NumberOptionable {
    let command = "pick"
    let overview = "Pick one from many (works with arguments and stdin)"
    let subparser: ArgumentParser
    var subcommands: [Command] = []

    let options: PositionalArgument<[String]>
    let number: OptionArgument<Int>

    required init(parser: ArgumentParser) {
        subparser = parser.add(subparser: command, overview: overview)
        options = subparser.add(positional: "options", kind: [String].self, optional: true, strategy: .upToNextOption, usage: "random pick optionA optionB...")
        number = subparser.addNumberArgument(usage: "Number of items to pick")
    }

    func run(with arguments: ArgumentParser.Result) throws {
        let number = arguments.get(self.number) ?? 1
        let params = arguments.get(self.options) ?? []
        let inputLines = splitFirstLineIfNeeded(lines: StandardInput.readAvailableLines())
        let options = splitWordIfNeeded(words: params + inputLines)

        let picks = Randomizer().pick(options: options, times: number)
        if picks.isEmpty {
            Logger.error.log("No options to pick from")
        }
        else {
            Logger.standard.log(picks)
        }
    }

}
