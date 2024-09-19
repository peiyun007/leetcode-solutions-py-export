class Solution {
    func sumOfPower(_ nums: [Int], _ k: Int) -> Int {
        let mod = 1_0000_0000_7
        let n = nums.count
        var f = Array(repeating: Array(repeating: 0, count: n+1), count: k+1)
        f[0][0] = 1
        for (i, x) in nums.enumerated() {
            if x > k { continue }
            for j in (x...k).reversed() {
                for c in (1...i+1).reversed() {
                    f[j][c] = (f[j][c] + f[j-x][c-1]) % mod
                }
            }
        }
        var ans = 0
        var power = 1
        for c in (1...n).reversed() {
            ans = (ans + (f[k][c] * power) % mod) % mod
            power = (power * 2) % mod
        }
        return ans
    }
}