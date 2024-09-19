class Solution {
    func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
         var dp = Array(repeating: Array(repeating: Int.max / 2, count: s2.count + 1), count: s1.count + 1)
        dp[0][0] = 0
        let arr1 = Array(s1)
        let arr2 = Array(s2)
        for i in 1...arr1.count {
            dp[i][0] = dp[i-1][0] + Int(arr1[i-1].asciiValue!)
        }
        for j in 1...arr2.count {
            dp[0][j] = dp[0][j-1] + Int(arr2[j-1].asciiValue!)
        }
        for i in 1...arr1.count {
            for j in 1...arr2.count {
                if arr1[i-1] == arr2[j-1] {
                    dp[i][j] = dp[i-1][j-1]
                } else {
                    dp[i][j] = min(dp[i-1][j]+Int(arr1[i-1].asciiValue!), dp[i][j-1]+Int(arr2[j-1].asciiValue!))
                }
            }
        }
        return dp[arr1.count][arr2.count]
    }
}