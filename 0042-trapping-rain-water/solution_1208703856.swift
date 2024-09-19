class Solution {
    // 参考：花花酱
    func trap(_ height: [Int]) -> Int {
        if height.count == 0 {
            return 0
        }
        var l = 0, r = height.count - 1
        var max_l = height[l]
        var max_r = height[r]
        var ans = 0
        while l < r {
            if max_l < max_r {
                ans += max_l - height[l]
                l += 1
                max_l = max(max_l, height[l])
            } else {
                ans += max_r - height[r]
                r -= 1
                max_r = max(max_r, height[r])
            }
        }
        return ans
    }
}