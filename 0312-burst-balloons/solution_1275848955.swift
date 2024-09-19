class Solution {
    func maxCoins(_ nums0: [Int]) -> Int {
        var nums = Array(repeating: 1, count: nums0.count + 2)
        for i in 0..<nums0.count {
            nums[i+1] = nums0[i]
        }
        let n = nums.count
        var memo = Array(repeating: Array(repeating: -1, count: n), count: n)
        return dfs(0, n-1)

        func dfs(_ i: Int, _ j: Int) -> Int {
            if j-i <= 1 {
                return 0
            }
            if memo[i][j] != -1 {
                return memo[i][j]
            }
            var res = 0
            for k in i+1..<j {
                let x = nums[i] * nums[k] * nums[j] + dfs(i, k) + dfs(k, j)
                res = max(res, x)
            }
            memo[i][j] = res
            return res
        }
    }
}