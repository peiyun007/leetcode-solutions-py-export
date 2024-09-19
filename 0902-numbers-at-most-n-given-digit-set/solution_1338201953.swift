class Solution {
    func atMostNGivenDigitSet(_ digits: [String], _ n: Int) -> Int {
        let sArr = Array(String(n, radix: 10))
        var memo = Array(repeating: -1, count: sArr.count)
        return dfs(0, true, false)

        func dfs(_ i: Int, _ isLimit: Bool, _ isNum: Bool) -> Int {
            if i == sArr.count {
                return isNum ? 1 : 0
            }
            if !isLimit && isNum && memo[i] != -1 {
                return memo[i]
            }
            var ans = 0
            if !isNum {
                ans += dfs(i+1, false, false) 
            // 前面不填数字，那么可以跳过当前数位，也不填数字
            // isLimit 改为 false，因为没有填数字，位数都比 n 要短，自然不会受到 n 的约束
            // isNum 仍然为 false，因为没有填任何数字
            }
            let x = Int(String(sArr[i])) ?? 0
            let up = isLimit ? x : 9
            for ch in digits {
                let d = Int(String(ch)) ?? 0
                if d > up { break }
                ans += dfs(i+1, isLimit && d == up, true)
            }
            if !isLimit && isNum {
                memo[i] = ans
            }
            return ans
        }
    }
}