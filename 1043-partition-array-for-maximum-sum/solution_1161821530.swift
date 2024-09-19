class Solution {
    func maxSumAfterPartitioning(_ arr: [Int], _ k: Int) -> Int {
        var dp = Array(repeating: 0, count: arr.count+1)
        for i in 1...arr.count {
            var mx = arr[i-1]
            for j in 1...k {
                if i >= j {
                    mx = max(mx, arr[i-j])
                    dp[i] = max(dp[i], dp[i-j] + mx * j)
                }
            }
        }
        return dp[arr.count]
    }
}