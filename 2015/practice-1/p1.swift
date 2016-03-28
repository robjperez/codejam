import Foundation

let stdin = NSFileHandle.fileHandleWithStandardInput()
let input = stdin.readDataToEndOfFile()
let lines = NSString(data: input, encoding:NSUTF8StringEncoding)!.componentsSeparatedByString("\n")
let cases = Int(lines[0])!

func charToInt(str: String, atIndex i: Int) -> Int {
    return Int(String(str[str.startIndex.advancedBy(i)]))!
}

var friends = [Int](count: cases, repeatedValue: 0)

for idx in 1..<lines.count {
    if lines[idx].isEmpty { continue }

    let values = lines[idx].componentsSeparatedByString(" ")
    let maxLevel = Int(values[0])!
    let data = values[1]

    var sum = charToInt(data, atIndex: 0)
    var caseFriends = 0

    if maxLevel > 0 {
        for lvl in 1...maxLevel {
            if sum < lvl {
                caseFriends += (lvl - sum)
                sum = lvl
            }
            sum += charToInt(data, atIndex: lvl)
        }
    }
    friends[idx-1] = caseFriends
}

for idx in friends.indices {
    print("Case #\(idx+1): \(friends[idx])")
}
