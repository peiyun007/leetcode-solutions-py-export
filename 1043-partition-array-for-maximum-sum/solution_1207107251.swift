class Solution {
    func maxSumAfterPartitioning(_ arr: [Int], _ K: Int) -> Int {
        var dp = Array(repeating: 0, count:arr.count+1)
        for i in 0...arr.count {
            var m = 0
            for k in 1...K {
                if i-k < 0 {
                    break
                }
                m = max(m, arr[i-k])
                dp[i] = max(dp[i], dp[i-k] + k*m)
            }
        }
        return dp[arr.count]
    }
}