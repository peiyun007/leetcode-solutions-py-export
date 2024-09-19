class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var dict: [Character: Int] = [:]
        let duplicateFlag = -1
        for (index, ch) in s.enumerated() {
            dict[ch] = dict[ch] != nil ? duplicateFlag : index
        }
        for ch in s {
            if let index = dict[ch], index != duplicateFlag {
                return index
            }
        }
        return -1
    }
}