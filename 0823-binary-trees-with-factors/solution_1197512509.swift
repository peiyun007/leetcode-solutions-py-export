class Solution {
    func numFactoredBinaryTrees(_ arr: [Int]) -> Int {
        let mod = 1_0000_0000_7
        let A = arr.sorted { $0 < $1 }
        var dp = [Int: Int]()
        for i in 0..<arr.count {
            dp[A[i]] = 1
            for j in 0..<i {
                if A[i] % A[j] == 0, let val = dp[A[i] / A[j]] {
                    let a = (val * (dp[A[j]] ?? 1)) % mod
                    dp[A[i]] = ((dp[A[i]] ?? 1) + a) % mod
                }
            }
        }
        var ans = 0
        for (key, value) in dp {
            ans = (ans + value) % mod
        }
        return ans
    }
}