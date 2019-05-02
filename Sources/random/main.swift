import CommandRegistry

var program = CommandRegistry(usage: "<subcommand> <options>", overview: "A random command line tool 🎲")
program.register(command: DiceCommand.self)
program.register(command: PickCommand.self)
program.register(command: ShuffleCommand.self)
program.run()
