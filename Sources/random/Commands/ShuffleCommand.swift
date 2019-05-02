import Foundation
import Utility
import CommandRegistry
import Logger

class ShuffleCommand: Command, LineProcessorType {
    let command = "shuffle"
    let overview = "Shuffle input elements in random order (works with arguments and stdin)"
    let subparser: ArgumentParser
    var subcommands: [Command] = []

    let options: PositionalArgument<[String]>

    required init(parser: ArgumentParser) {
        subparser = parser.add(subparser: command, overview: overview)
        options = subparser.add(positional: "options", kind: [String].self, optional: true, strategy: .upToNextOption, usage: "random shuffle optionA optionB...")
    }

    func run(with arguments: ArgumentParser.Result) throws {
        let params = arguments.get(self.options) ?? []
        let inputLines = splitFirstLineIfNeeded(lines: StandardInput.readAvailableLines())
        var options = splitWordIfNeeded(words: params + inputLines)

        options = Randomizer().shuffle(options: options)
        Logger.standard.log(options)
    }

}
