class Solution {
    func countSteppingNumbers(_ low: String, _ high: String) -> Int {
        let mod = 1_0000_0000_7
        return ((calc(high) - calc(low) + mod) % mod + (isValid(low) ? 1 : 0)) % mod

        func calc(_ s: String) -> Int {
            let sArr = Array(s)
            let n = sArr.count
            var memo = Array(repeating: Array(repeating: -1, count: 10), count: 101)
            return dfs(0, 0, true, false)

            func dfs(_ i: Int, _ pre: Int, _ isLimit: Bool, _ isNumber: Bool) -> Int {
                if i == n {
                    return isNumber ? 1 : 0
                }
                if !isLimit && isNumber && memo[i][pre] != -1 {
                    return memo[i][pre]
                }
                var ans = 0
                if !isNumber {
                    ans += dfs(i+1, pre, false, false)
                    ans %= mod
                }
                let start = isNumber ? 0 : 1
                let up = isLimit ? Int(String(sArr[i])) ?? 0 : 9
                if up >= start {
                    for d in start...up {
                        if !isNumber || abs(d-pre) == 1 {
                            ans += dfs(i+1, d, isLimit && d == up, true)
                            ans %= mod
                        }
                    }
                }
                if !isLimit && isNumber {
                    memo[i][pre] = ans
                }
                return ans
            }
        }

        func isValid(_ low: String) -> Bool {
            let sArr = Array(low)
            for i in 1..<sArr.count {
                if abs((Int(String(sArr[i])) ?? 0) - (Int(String(sArr[i-1])) ?? 0)) != 1 {
                    return false
                }
            }
            return true
        }
    }
}