class Solution {
    func minScoreTriangulation(_ values: [Int]) -> Int {
        let n = values.count
        var memo = Array(repeating: Array(repeating: -1, count: n), count: n)
        return dfs(0, n-1)

        func dfs(_ i: Int, _ j: Int) -> Int {
            if i+1 == j {
                return 0
            }
            if memo[i][j] != -1 {
                return memo[i][j]
            }
            var ans = Int.max
            for k in i+1..<j {
                ans = min(ans, dfs(i, k) + dfs(k, j) + values[i] * values[k] * values[j])
            }
            memo[i][j] = ans
            return ans
        }
    }
}