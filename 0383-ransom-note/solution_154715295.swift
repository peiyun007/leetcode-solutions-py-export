class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var countDict: [Character: Int] = [:]
        for ch in magazine {
            countDict[ch] = (countDict[ch] ?? 0) + 1
        }
        for ch in ransomNote {
            guard let count = countDict[ch], count > 0 else {
                return false
            }
            countDict[ch] = count - 1
        }
        return true
    }
}