class Solution {
    func numberOfSets(_ n: Int, _ kx: Int) -> Int {
        let mod = 1_0000_0000_7
        var memo = Array(repeating: Array(repeating: Array(repeating: -1, count: 2), count: kx+1), count: n+1)
        return (dfs(n-1, kx, 0) + dfs(n-1, kx, 1)) % mod

        func dfs(_ i: Int, _ j: Int, _ k: Int) -> Int {
            if i == 0 && j == 0 && k == 0 {
                return 1
            }
            if i < 0 || j < 0 {
                return 0
            }
            if memo[i][j][k] != -1 {
                return memo[i][j][k]
            }
            var ans = 0
            if k == 0 {
                ans = (dfs(i-1, j, 0) + dfs(i-1, j, 1)) % mod
            } else if k == 1 {
                ans = dfs(i-1, j, 1)
                ans = (ans + dfs(i-1, j-1, 0)) % mod
                ans = (ans + dfs(i-1, j-1, 1)) % mod
            }
            memo[i][j][k] = ans
            return ans
        }
    }
}
