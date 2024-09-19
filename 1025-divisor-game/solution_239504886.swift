class Solution {
    func divisorGame(_ N: Int) -> Bool {
        var dp = Array(repeating: -1, count: N + 1)
        dp[0] = 1
        dp[1] = 0
        return helper(N, &dp)
    }
    
    private func helper(_ N: Int, _ dp: inout [Int]) -> Bool {
        if dp[N] != -1 {
            return dp[N] == 1 ? true : false
        }
        dp[N] = 0
        for i in 1...N/2 {
            if N % i == 0 {
                if !helper(N - i, &dp) {
                    dp[N] = 1
                    break
                }
            }
        }
        return dp[N] == 1 ? true : false
    }
}