class Solution {
    /* 解法1: 用dp
    func countNumbersWithUniqueDigits(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n+1)
        dp[0] = 1
        if n >= 1 {
            dp[1] = 9
        }
        if n >= 2 {
            for i in 2...n {
                dp[i] = dp[i-1]*(11-i)
            }
        }
        return dp.reduce(0){$0+$1}
    }
    */
    // 解法2：用backtracking来解
    var res = 0
    func countNumbersWithUniqueDigits(_ n: Int) -> Int {
        if n == 0 {
            return 1
        }
        var set = Set<Int>()
        var temp = [Int]()
        dfs(n, &set, &temp)
        return res
    }
    
    private func dfs(_ n: Int, _ seen: inout Set<Int>, _ temp: inout [Int]) {
        if temp.count > n || temp.count >= 2 && temp[0] == 0 {
            return
        }
        if temp.count != 0 {
            res += 1
        }
        for i in 0..<10 {
            if !seen.contains(i) {
                seen.insert(i)
                temp.append(i)
                dfs(n, &seen, &temp)
                temp.removeLast()
                seen.remove(i)
            }
        }
    }
}