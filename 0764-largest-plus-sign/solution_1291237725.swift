class Solution {
    func orderOfLargestPlusSign(_ n: Int, _ mines: [[Int]]) -> Int {
        let banned = Set<[Int]>(mines)
        let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        var res = 0
        var memo = Array(repeating: Array(repeating: Array(repeating: -1, count: 4), count: n), count: n)
        var g = Array(repeating: Array(repeating: 1, count: n), count: n)
        for m in mines {
            g[m[0]][m[1]] = 0
        }
        for i in 0..<n {
            for j in 0..<n {
                if g[i][j] == 0 {
                    continue
                }
                var ans = n
                for k in 0..<4 {
                    ans = min(ans, dfs(i, j, k)+1)
                }
                res = max(res, ans)
            }
        }
        return res

        func dfs(_ i: Int, _ j: Int, _ k: Int) -> Int {
            if memo[i][j][k] != -1 {
                return memo[i][j][k]
            }
            let nx = i+dirs[k].0
            let ny = j+dirs[k].1
            if nx < 0 || ny < 0 || nx >= n || ny >= n || g[nx][ny] == 0 {
                return 0
            }
            var ans = 1+dfs(nx, ny, k)
            memo[i][j][k] = ans
            return ans
        }
    }
}