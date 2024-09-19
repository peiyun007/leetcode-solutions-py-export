class Solution {
    func countDigitOne(_ n: Int) -> Int {
        let arr = Array(String(n))
        let m = arr.count
        var dp = Array(repeating: Array(repeating: -1, count: m), count: m)
        return dfs(0, 0, true)

        func dfs(_ i: Int, _ cnt: Int, _ isLimit: Bool) -> Int {
            if i == m {
                return cnt
            }
            if !isLimit && dp[i][cnt] != -1 {
                return dp[i][cnt]
            }
            var ans = 0
            let d = isLimit ? (Int(String(arr[i])) ?? 0) : 9
            for j in 0...d {
                ans += dfs(i+1, cnt+(j==1 ? 1 : 0), j==d && isLimit)
            }
            if !isLimit {
                dp[i][cnt] = ans
            }
            return ans
        }
    }
}