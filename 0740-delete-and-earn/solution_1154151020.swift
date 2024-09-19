class Solution {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        var maxVal = nums.reduce(0) { max($0, $1) }
        var dp = Array(repeating: 0, count: maxVal + 1)
        var arr = Array(repeating: 0, count: maxVal + 1)
        for num in nums {
            arr[num] = arr[num] + 1
        }
        dp[0] = 0
        dp[1] = arr[1]
        if maxVal == 1 {
            return dp[1]
        }
        var ans = 0
        for i in 2...maxVal {
            dp[i] = max(dp[i-2]+i*arr[i], dp[i-1])
            ans = max(ans, dp[i])
        }
        return ans
    }
}