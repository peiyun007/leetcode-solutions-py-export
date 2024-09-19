class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        var chars = [Character](s)
        var set = Set<Character>()
        var startIndex = 0
        var maxLen = 0
        for i in 0..<chars.count {
            let current = chars[i]
            if set.contains(current) {
                maxLen = max(maxLen, i - startIndex)
                while chars[startIndex] != current {
                    set.remove(chars[startIndex])
                    startIndex = startIndex + 1
                }
                startIndex = startIndex + 1
            } else {
                set.insert(current)
            }
        }
        maxLen = max(maxLen, chars.count - startIndex)
        return maxLen
    }
}