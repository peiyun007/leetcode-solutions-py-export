class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        let sArr = Array(s)
        var dp: [Int] = Array<Int>(repeating: 0, count: sArr.count)
        if sArr.count <= 1 {
            return 0
        }
        var currentMax = 0
        for i in 1..<sArr.count {
            var tmp = i - dp[i - 1] - 1
            if sArr[i] == ")" {
                if sArr[i - 1] == "(" {
                    dp[i] = (i >= 2 ? dp[i-2] : 0) + 2
                } else if (tmp >= 0 && sArr[tmp] == "(") {
                    dp[i] = dp[i - 1] + 2 + (tmp >= 1 ? dp[tmp - 1] : 0)
                }
            }
            currentMax = max(currentMax, dp[i])
        }
        return currentMax
    }
}
