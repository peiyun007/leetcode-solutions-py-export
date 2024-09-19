class Solution {
    func countPartitions(_ nums: [Int], _ k: Int) -> Int {
        let sum = nums.reduce(0) { $0+$1 }
        if sum < k * 2 {
            return 0
        }
        let n = nums.count
        let mod = 1_0000_0000_7
        var dp = Array(repeating: 0, count: k+1)
        dp[0] = 1
        var ans = 1
        for i in 0..<n {
            ans = (ans * 2) % mod
            let x = nums[i]
            for j in (0..<k).reversed() {
                if j-x >= 0 {
                    dp[j] = (dp[j] + dp[j-x]) % mod
                }
            }
        }
        var sumDp = dp.reduce(0) { ($0+$1) % mod }
        sumDp = (sumDp * 2) % mod
        return (ans - sumDp + mod) % mod
    }
}