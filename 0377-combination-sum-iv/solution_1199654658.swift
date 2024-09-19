class Solution {

    var memo = [Int: Int]()
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        return dfs(nums, target)
    }

    func dfs(_ nums: [Int], _ target: Int) -> Int {
        if target == 0 {
            return 1
        }
        if target < 0 {
            return 0
        }
        if let val = memo[target] {
            return val
        }
        var res = 0
        for num in nums {
            res += dfs(nums, target-num)
        }
        memo[target] = res
        return res
    }
}