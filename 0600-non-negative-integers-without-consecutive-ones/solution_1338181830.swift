class Solution {
    func findIntegers(_ n: Int) -> Int {
        let sArr = Array(String(n, radix: 2))
        var memo = Array(repeating: Array(repeating: -1, count: 2), count: sArr.count)
        return dfs(0, false, true)

        func dfs(_ i: Int, _ pre1: Bool, _ isLimit: Bool) -> Int {
            if i == sArr.count {
                return 1
            }
            let preInt = pre1 ? 1 : 0
            if !isLimit && memo[i][preInt] != -1 {
                return memo[i][preInt]
            }
            var ans = 0
            let x = sArr[i] == "0" ? 0 : 1
            let up = isLimit ? x : 1
            ans += dfs(i+1, false, isLimit && up == 0)  //填0
            if !pre1 && up == 1 {
                ans += dfs(i+1, true, isLimit && up == 1)  //填1
            }
            memo[i][preInt] = ans
            return ans
        }
    }
}