class Solution {
    func divisorGame(_ N: Int) -> Bool {
        var dp: Array<Bool?> = Array(repeating: nil, count: N + 1)
        dp[0] = true
        dp[1] = false
        return helper(N, &dp)
    }
    
    private func helper(_ N: Int, _ dp: inout [Bool?]) -> Bool {
        if let flag = dp[N] {
            return flag
        }
        dp[N] = false
        for i in 1...N/2 {
            if N % i == 0 {
                if !helper(N - i, &dp) {
                    dp[N] = true
                    break
                }
            }
        }
        return dp[N] ?? false
    }
}