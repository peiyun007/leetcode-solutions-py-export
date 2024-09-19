class Solution {
    private var memo = [String : Int]()
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        return dfs(nums, target, nums.count - 1, 0)
    }

    func dfs(_ nums: [Int], _ target: Int, _ index: Int, _ sum: Int) -> Int {
        if let val = memo["\(index)_\(sum)"] {
            return val
        }
        if index < 0 && sum == target {
            return 1
        }
        if index < 0 {
            return 0
        }
        let positive = dfs(nums, target, index-1, sum+nums[index])
        let negative = dfs(nums, target, index-1, sum-nums[index])
        memo["\(index)_\(sum)"] = positive + negative
        return positive + negative
    }
}