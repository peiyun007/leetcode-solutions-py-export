class Solution {
    
    /*
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        let chars = [Character](s)
        var set = Set<Character>()
        var startIndex = 0
        var maxLen = 0
        for i in 0..<chars.count {
            let current = chars[i]
            if set.contains(current) {
                maxLen = max(maxLen, i - startIndex)
                while chars[startIndex] != current {
                    set.remove(chars[startIndex])
                    startIndex += 1
                }
                startIndex += 1
            } else {
                set.insert(current)
            }
        }
        return max(maxLen, chars.count - startIndex)
    }
    */
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var ans = 0
        let chars = [Character](s)
        for i in 0..<chars.count {
            var map = [Character: Bool]()
            var j = i
            while j < chars.count && map[chars[j]] == nil {
                map[chars[j]] = true
                ans = max(ans, j - i + 1)
                j += 1
            }
        }
        return ans
    }
}