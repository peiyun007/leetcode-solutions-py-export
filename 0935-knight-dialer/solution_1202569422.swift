class Solution {
    let mod = 1_0000_0000_7
    func knightDialer(_ K: Int) -> Int {
        let dirs = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
        let m = 4
        let n = 3
        var dp = Array(repeating: Array(repeating: 1, count: n), count: m)
        dp[3][0] = 0
        dp[3][2] = 0
        for k in 1..<K {
            var temp = Array(repeating: Array(repeating: 0, count: n), count: m)
            for i in 0..<m {
                for j in 0..<n {
                    if i == 3 && j != 1 {
                        continue
                    }
                    for dir in dirs {
                        let x = i + dir[0]
                        let y = j + dir[1]
                        if x < 0 || y < 0 || x >= m || y >= n {
                            continue
                        }
                        temp[i][j] = (temp[i][j] + dp[x][y]) % mod
                    }
                }
            }
            dp = temp
        }
        var ans = 0
        for i in 0..<m {
            for j in 0..<n {
                ans = (ans + dp[i][j]) % mod
            }
        }
        return ans
    }
}