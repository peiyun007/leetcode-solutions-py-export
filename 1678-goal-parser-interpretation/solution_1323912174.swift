class Solution {
    func interpret(_ command: String) -> String {
        let sArr = Array(command)
        var tArr = [Character]()
        var i = 0
        while i < sArr.count {
            let ch = sArr[i]
            if ch == "G" {
                tArr.append("G")
                i += 1
            } else if ch == "(" && sArr[i+1] == ")" {
                tArr.append("o")
                i += 2
            } else if ch == "(" && sArr[i+1] == "a" && sArr[i+2] == "l" && sArr[i+3] == ")" {
                tArr.append("a")
                tArr.append("l")
                i += 4
            }
        }
        return String(tArr)
    }
}