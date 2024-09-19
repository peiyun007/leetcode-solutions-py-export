class Solution {
    func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
        var w = Array(repeating: Array(repeating: Int.max / 2, count: n), count: n)
        for e in edges {
            w[e[0]][e[1]] = e[2]
            w[e[1]][e[0]] = e[2]
        }
        var memo = Array(repeating: Array(repeating: Array(repeating: -1, count: n), count: n), count: n)

        func dfs(_ i: Int, _ j: Int, _ k: Int) -> Int {
            if k < 0 {
                return w[i][j]
            }
            if memo[i][j][k] != -1 {
                return memo[i][j][k]
            }
            let res = min(dfs(i, j, k-1), dfs(i, k, k-1) + dfs(k, j, k-1))
            memo[i][j][k] = res
            return res
        }

        var ans = 0
        var minCnt = Int.max
        for i in 0..<n {
            var cnt = 0
            for j in 0..<n {
                if i != j && dfs(i, j, n-1) <= distanceThreshold {
                    cnt += 1
                }
            }
            if cnt <= minCnt {
                minCnt = cnt
                ans = i
            }
        }
        return ans
    }
}