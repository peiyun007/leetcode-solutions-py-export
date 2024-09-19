class Solution {
    private var dp: [Int] = []
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        dp = Array(repeating: -1, count: target + 1)
        return helper(nums, target)
    }
    func helper(_ nums: [Int], _ target: Int) -> Int {
        if dp[target] != -1 {
            return dp[target]
        }
        if target == 0 {
            return 1
        }
        var res = 0
        for i in 0..<nums.count {
            if target >= nums[i] {
                res += helper(nums, target - nums[i])
            }
        }
        dp[target] = res
        return res
    }
    
}