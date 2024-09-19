class Solution {
    func balancedStringSplit(_ s: String) -> Int {
        var ans = 0
        var cnt = 0
        for ch in s {
            if ch == "L" {
                cnt += 1
            } else {
                cnt -= 1
            }
            if cnt == 0 {
                ans += 1
            }
        }
        return ans
    }
}