class Solution {
    func numberOfPowerfulInt(_ start: Int, _ finish: Int, _ limit: Int, _ s: String) -> Int {
        var sArr1 = Array(String(start))
        var sArr2 = Array(String(finish))
        var sArr0 = Array(repeating: Character("0"), count: sArr2.count - sArr1.count)
        sArr0 += sArr1
        sArr1 = sArr0
        let n = sArr2.count
        var memo = Array(repeating: -1, count: n)
        var sArr = Array(s)
        return dfs(0, true, true)

        func dfs(_ i: Int,  _ limitLow: Bool, _ limitHigh: Bool) -> Int {
            if i == n {
                return 1
            }
            if !limitLow && !limitHigh && memo[i] != -1 {
                return memo[i]
            }
            let lo = limitLow ? Int(String(sArr1[i])) ?? 0 : 0
            let hi = limitHigh ? Int(String(sArr2[i])) ?? 0 : 9
            var ans = 0
            if i < n - sArr.count {
                if lo <= min(hi, limit) {
                    for d in lo...min(hi, limit)  {
                        ans += dfs(i+1, limitLow && d == lo, limitHigh && d == hi)
                    }
                }
            } else {
                let d = Int(String(sArr[i-(n-sArr.count)])) ?? 0
                if d >= lo && d <= min(hi, limit) {
                    ans += dfs(i+1, limitLow && d == lo, limitHigh && d == hi)
                }
            }
            if !limitLow && !limitHigh {
                memo[i] = ans
            }
            return ans
        }
    }
}