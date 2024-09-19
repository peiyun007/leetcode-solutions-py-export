class Solution {
    func knightProbability(_ n: Int, _ K: Int, _ row: Int, _ column: Int) -> Double {
        if K == 0 {
            return 1
        }
        let dirs = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
        var dp = Array(repeating: Array(repeating: 0.0, count: n), count: n)
        dp[row][column] = 1.0
        for k in 1...K {
            var temp = Array(repeating: Array(repeating: 0.0, count: n), count: n)
            for i in 0..<n {
                for j in 0..<n {
                    var ans: Double = 0.0
                    for dir in dirs {
                        let x = i + dir[0]
                        let y = j + dir[1]
                        if x < 0 || y < 0 || x >= n || y >= n {
                            continue
                        }
                        temp[i][j] += dp[x][y] / 8.0
                    }
                }
            }
            dp = temp
        }
        var ans: Double = 0
        for i in 0..<n {
            for j in 0..<n {
                ans += Double(dp[i][j])
            }
        }
        return ans
    }
}