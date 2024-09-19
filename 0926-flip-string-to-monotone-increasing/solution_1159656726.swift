class Solution {
    func minFlipsMonoIncr(_ s: String) -> Int {
        var dp0 = 0, dp1 = 0
        for ch in s {
            var dp0Temp = dp0
            var dp1Temp = min(dp0, dp1)
            if ch == "1" {
                dp0Temp += 1
            } else {
                dp1Temp += 1
            }
            dp0 = dp0Temp
            dp1 = dp1Temp
        }
        return min(dp0, dp1)
    }
}