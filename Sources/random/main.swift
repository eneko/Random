import Foundation
import CommandRegistry

var commands = CommandRegistry(usage: "<subcommand> <options>", overview: "A random command line tool 🎲")
commands.register(command: DiceCommand.self)
commands.register(command: PickCommand.self)
commands.run()
