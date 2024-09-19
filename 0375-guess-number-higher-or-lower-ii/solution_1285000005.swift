class Solution {
    func getMoneyAmount(_ n: Int) -> Int {
        var memo = Array(repeating: Array(repeating: -1, count: n+1), count: n+1)
        return dfs(1, n)

        func dfs(_ i: Int, _ j: Int) -> Int {
            if i >= j {
                return 0
            }
            if memo[i][j] != -1 {
                return memo[i][j]
            }
            var res = Int.max
            for k in i...j {
                res = min(res, k+max(dfs(i, k-1), dfs(k+1, j)))
            }
            memo[i][j] = res
            return res
        }
    }
}