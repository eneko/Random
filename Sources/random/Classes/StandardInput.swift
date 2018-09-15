import Foundation

struct StandardInput {

    /// Check if the standard input buffer has received any data.
    /// Useful to prevent blocking the process if when no data is available yet.
    ///
    /// - Returns: True if there is data waiting to be read.
    static func hasData() -> Bool {
        guard let inputStream = InputStream(fileAtPath: "/dev/stdin") else {
            return false
        }
        inputStream.open()
        defer { inputStream.close() }
        return inputStream.hasBytesAvailable
    }

    /// Read all data from stdin.
    /// Will block process when using interactively or until data is fully read.
    ///
    /// - Returns: Data with full contents of stdin
    static func readData() -> Data {
        return FileHandle.standardInput.availableData
    }

    /// Read full standard input text as UTF8 string.
    /// Will block process when used interactively or until data is fully read.
    ///
    /// - Returns: UTF8 String with full contents of stdin
    static func readString() -> String {
        return String(data: readData(), encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
    }

    /// Read full standard input text line by line.
    /// Will block process when used interactively or until data is fully read.
    ///
    /// - Returns: Array of strings with full contents of stdin
    static func readLines() -> [String] {
        return AnyIterator { readLine() }.map { $0 }
    }

}
