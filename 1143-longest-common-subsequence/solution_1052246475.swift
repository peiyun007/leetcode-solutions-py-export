extension String {
    subscript(index: Int) -> Character {
        self[self.index(self.startIndex, offsetBy: index)]
    }
}

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: text2.count+1), count: text1.count+1)
        let a = Array(text1)
        let b = Array(text2)
        for i in 1...a.count {
            for j in 1...b.count {
                if a[i-1] == b[j-1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        return dp[text1.count][text2.count]
    }
}