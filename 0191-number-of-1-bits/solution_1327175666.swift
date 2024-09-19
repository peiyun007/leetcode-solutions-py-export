class Solution {
    func hammingWeight(_ n0: Int) -> Int {
        var n = n0, ans = 0
        while n != 0 {
            n &= (n-1)
            ans += 1
        }
        return ans
    }
}