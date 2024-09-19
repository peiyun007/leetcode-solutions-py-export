class Solution {
    
    func lenLongestFibSubseq(_ arr: [Int]) -> Int {
        // dp[i][j]表示以A[i], A[j]为结尾的最大长度
        guard arr.count >= 3 else {
            return 0
        }
        var dp = Array(repeating: Array(repeating: 2, count: arr.count), count: arr.count)
        var map = [Int: Int]()
        for (i, num) in arr.enumerated() {
            map[num] = i
        }
        var ans = 0
        for i in 0..<arr.count {
            for j in i+1..<arr.count {
                if let k = map[arr[j]-arr[i]], k < i {
                    dp[i][j] = max(dp[i][j], dp[k][i] + 1)
                    ans = max(ans, dp[i][j])
                }
            }
        }
        return ans
    }
}