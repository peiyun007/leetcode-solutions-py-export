class Solution {

    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let f: T
        let s: U
    }
    var dp = [Pair<Int, Int>: Int]()

    func dfs(_ nums: [Int], _ i: Int, _ j: Int) -> Int {
        if j < i {
            return 0
        }
        if let val = dp[Pair(f: i, s: j)] {
            return val
        }
        let res = max(dfs(nums, i, j-2) + nums[j], dfs(nums, i, j-1))
        dp[Pair(f: i, s: j)] = res
        return res
    }

    func rob(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        let n = nums.count
        return max(dfs(nums, 0, n-2), dfs(nums, 1, n-1))
    }
}