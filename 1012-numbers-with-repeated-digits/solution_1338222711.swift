class Solution {
    func numDupDigitsAtMostN(_ n: Int) -> Int {
        let sArr = Array(String(n, radix: 10))
        var memo = Array(repeating: Array(repeating: -1, count: 1 << 10), count: sArr.count)
        return n - dfs(0, 0, true, false)

        func dfs(_ i: Int, _ mask: Int, _ isLimit: Bool, _ isNum: Bool) -> Int {
            if i == sArr.count {
                return isNum ? 1 : 0
            }
            if !isLimit && isNum && memo[i][mask] != -1 {
                return memo[i][mask]
            }
            var ans = 0
            if !isNum {
                ans += dfs(i+1, mask, false, false) 
            // 前面不填数字，那么可以跳过当前数位，也不填数字
            // isLimit 改为 false，因为没有填数字，位数都比 n 要短，自然不会受到 n 的约束
            // isNum 仍然为 false，因为没有填任何数字
            }
            let x = Int(String(sArr[i])) ?? 0
            let up = isLimit ? x : 9
            let start = isNum ? 0 : 1
            for d in start...up {
                if (mask >> d) & 1 == 0 {
                    ans += dfs(i+1, mask | (1 << d), isLimit && d == up, true)
                }
            }
            if !isLimit && isNum {
                memo[i][mask] = ans
            }
            return ans
        }
    }
}