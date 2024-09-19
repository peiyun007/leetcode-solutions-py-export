class Solution {
    func maxAbsoluteSum(_ nums: [Int]) -> Int {
        let n = nums.count
        var ans = 0, f_max = Int.min, f_min = Int.max
        for i in 0..<n {
            f_max = max(f_max, 0) + nums[i]
            f_min = min(f_min, 0) + nums[i]
            ans = max(ans, abs(f_max), abs(f_min))
        }
        return ans
    }
}