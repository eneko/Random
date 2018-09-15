import Foundation
import Utility
import CommandRegistry
import Logger

class PickCommand: Command {
    let command = "pick"
    let overview = "Pick one from many (works with arguments and stdin)"

    private var options: PositionalArgument<[String]>

    required init(parser: ArgumentParser) {
        let subparser = parser.add(subparser: command, overview: overview)
        options = subparser.add(positional: "options", kind: [String].self, optional: true, strategy: .upToNextOption, usage: "random pick optionA optionB...")
    }

    func run(with arguments: ArgumentParser.Result) throws {
        var options = arguments.get(self.options) ?? []
        if StandardInput.hasData() {
            let lines = StandardInput.readLines()
            if lines.count == 1 {
                options.append(contentsOf: lines[0].components(separatedBy: " "))
            }
            else {
                options.append(contentsOf: lines)
            }
        }
        if options.count == 1 {
            options = options[0].map { String($0) }
        }
        pickOne(options: options)
    }

    func pickOne(options: [String]) {
        if let option = options.randomElement() {
            Logger.standard.log(option)
        }
        else {
            Logger.error.log("No options to pick from")
        }
    }

}
