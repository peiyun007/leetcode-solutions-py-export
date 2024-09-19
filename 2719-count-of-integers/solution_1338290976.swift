class Solution {
    func count(_ num1: String, _ num2: String, _ min_sum: Int, _ max_sum: Int) -> Int {
        let mod = 1_0000_0000_7
        var sArr = Array(repeating: Character("0"), count: num2.count - num1.count)
        sArr += Array(num1)
        let sArr1 = sArr
        let sArr2 = Array(num2)
        var memo = Array(repeating: Array(repeating: -1, count: max_sum + 1), count: sArr2.count)
        return dfs(0, 0, true, true)

        func dfs(_ i: Int, _ sum: Int, _ limitLow: Bool, _ limitHigh: Bool) -> Int {
            if sum > max_sum {
                return 0
            }
            if i == sArr2.count {
                return sum >= min_sum ? 1 : 0
            }
            if !limitLow && !limitHigh && memo[i][sum] != -1 {
                return memo[i][sum]
            }
            var ans = 0
            let lo = limitLow ? (Int(String(sArr1[i])) ?? 0) : 0
            let hi = limitHigh ? (Int(String(sArr2[i])) ?? 0) : 9
            for d in lo...hi {
                ans = (ans + dfs(i+1, sum+d, limitLow && d == lo, limitHigh && d == hi)) % mod
            }
            if !limitLow && !limitHigh {
                memo[i][sum] = ans
            }
            return ans
        }
    }
}