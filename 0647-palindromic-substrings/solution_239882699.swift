private extension String {
    subscript(index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}

/*
class Solution {
    func countSubstrings(_ s: String) -> Int {
        let N = s.count
        if N == 0 {
            return 0
        }
        var res = 0
        for center in 0...2*N-1 {
            var left = center / 2
            var right = (center + 1) / 2
            while left >= 0 && right < N && s[left] == s[right] {
                res += 1
                left -= 1
                right += 1
            }
        }
        return res
    }
}
*/

class Solution {
    func countSubstrings(_ s: String) -> Int {
        let n = s.count
        var chars = Array(s)
        var res = 0
        var dp = Array(repeating: Array(repeating: false, count: n), count: n)
        for i in (0..<n).reversed() {
            for j in i..<n {
                dp[i][j] = (chars[i] == chars[j]) && (j - i < 3 || dp[i + 1][j - 1])
                if dp[i][j] {
                    res += 1
                }
            }
        }
        return res
    }
}