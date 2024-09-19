class Solution {
    func kInversePairs(_ n: Int, _ k: Int) -> Int {
        // f[i][j] = sum(f[i−1][j−(i−1−x)]) = sum(f[i−1][j−x])  x从0到i-1,那么j-x就从j-i+1到j
        // f[n][k]
        let mod = Int(1e9+7)
        var sum = Array(repeating: Array(repeating: 0, count: k+1), count: n+1)
        var f = Array(repeating: Array(repeating: 0, count: k+1), count: n+1)
        // f[1][0] = 1
        for j in 0..<sum[1].count {
            sum[1][j] = 1
        }
        if n == 1 {
            return k == 0 ? 1 : 0
        }

        for i in 2...n {
            for j in 0...k {
                f[i][j] = j < i ? sum[i-1][j] : (sum[i-1][j] - sum[i-1][j-i] + mod) % mod
                sum[i][j] = j == 0 ? f[i][j] : (sum[i][j-1] + f[i][j]) % mod
            }
        }
        return f[n][k]
    }
}