class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var ret = Array(repeating: Array(repeating: 0, count: n), count: n)
        var k = 1, i = 0
        while k <= n * n {
            var j = i
            while j < n - i {     // Horizontal, from left to right
                ret[i][j] = k
                j += 1
                k += 1
            }
            j = i + 1
            while j < n - i {   // Vertical, from top to bottom
                ret[j][n-i-1] = k
                j += 1
                k += 1
            }
            j = n - i - 2
            while j > i {     //Horizontal, from right to left
                ret[n-i-1][j] = k
                j -= 1
                k += 1
            }
            j = n - i - 1
            while j > i {     //Vertical, from bottom to top
                ret[j][i] = k
                j -= 1
                k += 1
            }
            i += 1
        }
        return ret
    }
}