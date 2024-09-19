class Solution {
    func longestSubsequence(_ arr: [Int], _ difference: Int) -> Int {
        var dp = [Int: Int]()
        var res = 0
        for num in arr {
            var ans = 1
            if let val = dp[num-difference] {
                ans = val + 1
            }
            dp[num] = ans
            res = max(res, ans)
        }
        return res
    }
}