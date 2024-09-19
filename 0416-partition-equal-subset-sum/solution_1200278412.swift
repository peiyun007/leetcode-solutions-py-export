class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let sum = nums.reduce(0) {$0+$1}
        if sum % 2 != 0 {
            return false
        }
        let target = sum / 2
        var dp = Array(repeating: false, count: sum + 1)
        dp[0] = true
        for num in nums {
            for i in (num...sum).reversed() {
                if dp[i-num] {
                    dp[i] = true
                }
            }
        }
        return dp[target]
    }
}