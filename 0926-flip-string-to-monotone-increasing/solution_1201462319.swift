class Solution {
    func minFlipsMonoIncr(_ s: String) -> Int {
        let arr = Array(s)
        var dp0 = 0, dp1 = 0
        for i in 1...arr.count {
            if arr[i-1] == "0" {
                dp1 = min(dp0, dp1) + 1
            } else {
                let temp = dp0
                dp0 += 1
                dp1 = min(temp, dp1)
            }
        }
        return min(dp0, dp1)
    }
}