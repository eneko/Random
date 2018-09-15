import Foundation
import CommandRegistry

var commands = CommandRegistry(usage: "random <subcommand>", overview: "A random command line tool")
commands.register(command: DiceCommand.self)
commands.register(command: PickCommand.self)
commands.run()

//
//// Evaluate command parameters first and return a random one, if any
//let arguments = Array(ProcessInfo.processInfo.arguments.dropFirst())
//if arguments.isEmpty == false, let argument = arguments.randomElement() {
//    print(argument)
//    exit(0)
//}
//
//// Evaluate stdin and return a random line.
//// For single line, split words and return random word.
//// For multiple lines, return random line.
//// let input = readLine()
//// print(input)
//
//func readData() -> Data {
//    return FileHandle.standardInput.availableData
//}
//
//func readString() -> String {
//    return String(data: readData(), encoding: .utf8)!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
//}
//
//// let input = readString()
//// print(input)
//
//func readLines() -> [String] {
//    return AnyIterator { readLine() }.map { $0 }
//}
//
//
//let inputStream = InputStream(fileAtPath: "/dev/stdin")!
//inputStream.open()
//if inputStream.hasBytesAvailable {
//   print(readLines())
//}
//else {
//  print("no stdin")
//}
//inputStream.close()
