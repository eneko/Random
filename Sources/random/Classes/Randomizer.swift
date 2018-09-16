import Foundation

struct Randomizer {

    func pick<T>(options: [T]) -> T? {
        return options.randomElement()
    }

    func pick<T>(options: [T], times: Int) -> [T] {
        let picks = (1...times).map { _ in pick(options: options) }
        return picks.compactMap { $0 }
    }

    func shuffle<T>(options: [T]) -> [T] {
        return options.shuffled()
    }

}
