class Solution {
    func numDecodings(_ s: String) -> Int {
        let arr = Array(s)
        var dp = Array(repeating: 0, count: arr.count+1)
        dp[0] = 1
        dp[1] = arr[0] == "0" ? 0 : 1
        if arr.count <= 1 {
            return dp[arr.count]
        }
        for i in 2...arr.count {
            let a = Int(String(arr[i-1])) ?? 0
            let b = Int(String(arr[i-2])) ?? 0
            let num = b * 10 + a
            if a >= 1 && a <= 9 {
                dp[i] = dp[i-1]
            }
            if num >= 10 && num <= 26 {
                dp[i] += dp[i-2]
            }
        }
        return dp[arr.count]
    }
}