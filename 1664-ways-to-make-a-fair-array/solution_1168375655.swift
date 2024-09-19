class Solution {
    func waysToMakeFair(_ nums: [Int]) -> Int {
        var s_odd = 0, s_even = 0, now_odd = 0, now_even = 0
        for i in 0..<nums.count {
            if i % 2 == 1 {
                s_odd += nums[i]
            } else {
                s_even += nums[i]
            }
        }
        var res = 0
        for i in 0..<nums.count {
            var suffix_odd = 0, suffix_even = 0
            if i == 0 {
                suffix_even = s_odd
                suffix_odd = s_even - nums[0]
            } else {
                suffix_even = s_odd - now_odd
                suffix_odd = s_even - now_even
                if i % 2 == 1 {
                    suffix_even -= nums[i]
                } else {
                    suffix_odd -= nums[i]
                }
            }
            if suffix_odd + now_odd == suffix_even + now_even {
                res += 1
            }
            if i % 2 == 1 {
                now_odd += nums[i]
            } else {
                now_even += nums[i]
            }
        }
        return res
    }
}