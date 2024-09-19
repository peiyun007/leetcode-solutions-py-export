class Solution {
    func maxSumOfThreeSubarrays(_ nums0: [Int], _ k: Int) -> [Int] {
        let nums = Array(nums0.reversed())
        let n = nums.count
        var sum = Array(repeating: 0, count: n+1)
        for i in 1...n {
            sum[i] = sum[i-1] + nums[i-1]
        }
        var f = Array(repeating: Array(repeating: 0, count: 4), count: n+1)
        for i in 1...n {
            for j in 1...3 {
                if i >= k {
                    f[i][j] = max(f[i-1][j], f[i-k][j-1] + sum[i] - sum[i-k])
                } else {
                    f[i][j] = f[i-1][j]
                }
            }
        }
        var ans = Array(repeating: 0, count: 3)
        var j = 3, i = n, idx = 0
        while j > 0 {
            if i >= k && f[i-1][j] > f[i-k][j-1] + sum[i] - sum[i-k] {
                i -= 1
            } else {
                ans[idx] = n - i
                idx += 1
                j -= 1
                i -= k
            }
        }
        return ans
    }
}
