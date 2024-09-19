class Solution {
    
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        let sum = nums.reduce(0) { $0+$1 }
        if sum < abs(target) {
            return 0 
        }
        let offset = sum
        var dp = Array(repeating: Array(repeating: 0, count: sum+offset+1), count: nums.count+1)
        dp[0][offset] = 1
        for i in 0..<nums.count {
            for j in -sum...sum {
                let jj = j + offset
                if dp[i][jj] > 0 {
                    if jj-nums[i] >= 0 {
                        dp[i+1][jj-nums[i]] += dp[i][jj]
                    }
                    if jj+nums[i] <= sum+offset {
                        dp[i+1][jj+nums[i]] += dp[i][jj]
                    }
                }
            }
        }
        return dp[nums.count][target+offset]
    }
}