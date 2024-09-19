class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let totalSum = nums.reduce(0){$0+$1}
        if totalSum % 2 != 0 {
            return false
        }
        let n = nums.count
        let subsetSum = totalSum / 2
        var memo: [[Bool?]] = Array(repeating: Array(repeating: nil, count: subsetSum+1), count: n+1)
        return dfs(nums, n, subsetSum, &memo)
    }
    
    private func dfs(_ nums: [Int], _ n: Int, _ sum: Int, _ memo: inout [[Bool?]]) -> Bool {
        if sum == 0 {
            return true
        }
        if n == 0 || sum < 0 {
            return false
        }
        if let memoFlag = memo[n][sum] {
            return memoFlag
        }
        let flag = dfs(nums, n-1, sum-nums[n-1], &memo) || dfs(nums, n-1, sum, &memo)
        memo[n][sum] = flag
        return flag
    }
}