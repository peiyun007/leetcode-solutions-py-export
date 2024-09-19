class Solution {
    func countNumbersWithUniqueDigits(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n+1)
        dp[0] = 1
        if n >= 1 {
            dp[1] = 9
        }
        if n >= 2 {
            for i in 2...n {
                dp[i] = dp[i-1]*(11-i)
            }
        }
        return dp.reduce(0){$0+$1}
    }
}