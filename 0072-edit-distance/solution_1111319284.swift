class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let arr1 = Array(word1)
        let arr2 = Array(word2)
        var dp = Array(repeating: Array(repeating: 0, count: arr2.count+1), count: arr1.count+1)
        guard arr1.count > 0 && arr2.count > 0 else {
            return max(arr1.count, arr2.count)
        }
        for i in 1...arr1.count {
            dp[i][0] = i
        }
        for j in 1...arr2.count {
            dp[0][j] = j
        }
        for i in 1...arr1.count {
            for j in 1...arr2.count {
                if arr1[i-1] == arr2[j-1] {
                    dp[i][j] = dp[i-1][j-1]
                } else {
                    dp[i][j] = min(dp[i-1][j-1] + 1, dp[i-1][j] + 1, dp[i][j-1] + 1)
                }
            }
        }
        return dp[arr1.count][arr2.count]
    }
}