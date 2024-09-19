class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var set = Set<Int>(nums)
        var maxLen = Int.min
        for num in nums {
            if !set.contains(num-1) {
                var curLen = 0
                var dest = num
                while set.contains(dest) {
                    curLen += 1
                    dest += 1
                }
                maxLen = max(maxLen, curLen)
            }
        }
        return maxLen == Int.min ? 0 : maxLen
    }
}