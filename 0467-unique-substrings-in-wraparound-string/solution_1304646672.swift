class Solution {
    func findSubstringInWraproundString(_ s: String) -> Int {
        var lenMap = [Character: Int]()
        let sArr = Array(s)
        var w = 1
        for i in 0..<sArr.count {
            if i == 0 {
                w = 1
            } else if getInt(sArr[i]) - getInt(sArr[i-1]) == 1 || getInt(sArr[i]) - getInt(sArr[i-1]) == -25 {
                w += 1
            } else {
                w = 1
            }
            lenMap[sArr[i]] = max(lenMap[sArr[i], default: 0], w)
        }
        return lenMap.reduce(0) { $0 + $1.1 }
    }

    func getInt(_ c: Character) -> Int {
        return Int(c.asciiValue ?? 0)
    }
}