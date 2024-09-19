
class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 0 else {
            return ""
        }
        var maxStrLoc = (0, 0)
        let arr = Array(s)
        var dp = Array(repeating: Array(repeating: false, count: arr.count), count: arr.count)
        for i in (0..<arr.count).reversed() {
            for j in i..<arr.count {
                dp[i][j] = arr[i] == arr[j] && (j-1 <= i+1 || dp[i+1][j-1])
                if dp[i][j] && j-i+1 > maxStrLoc.1-maxStrLoc.0+1 {
                    maxStrLoc = (i, j)
                }
            }
        }
        return String(arr[maxStrLoc.0...maxStrLoc.1])
    }
}