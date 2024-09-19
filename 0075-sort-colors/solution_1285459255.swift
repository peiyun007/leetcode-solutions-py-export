class Solution {
    func sortColors(_ nums: inout [Int]) {
        var cnt = Array(repeating: 0, count: 3)
        for x in nums {
            cnt[x] += 1
        }
        var j = 0
        for i in 0..<cnt.count {
            var x = cnt[i]
            while x > 0 {
                cnt[i] -= 1
                x = cnt[i]
                nums[j] = i
                j += 1
            }
        }
    }
}