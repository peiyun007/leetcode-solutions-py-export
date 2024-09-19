class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var ans = 0
        for i in 0..<32 {
            if (n >> i) & 1 != 0 {
                ans += 1
            }
        }
        return ans
    }
}