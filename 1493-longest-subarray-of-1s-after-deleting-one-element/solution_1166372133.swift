class Solution {
    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let f: T
        let s: U
    }
    var memo = [Pair<Int, Bool>: Int]()
    var res = 0

    func solve(_ nums: [Int], _ n: Int, _ del: Bool) -> Int {
        if n < 0 {
            return 0
        }
        if let val = memo[Pair(f: n, s: del)] {
            return val
        }
        if del {  // if zero is already deleted 
            var ans = 0
            if nums[n] == 1 {
                ans = 1 + solve(nums, n-1, del)
                res = max(res, ans)
                memo[Pair(f: n, s: del)] = ans
                return ans
            }
            memo[Pair(f: n, s: del)] = 0
            return 0
        } else {
            var ans = 0
            if nums[n] == 1 {
                ans = 1 + solve(nums, n-1, del)
                res = max(res, ans)
                return ans
            }
            let deleted = solve(nums, n-1, true)
            let notDeleted = solve(nums, n-1, false)
            let ans2 = max(deleted, notDeleted)
            memo[Pair(f: n, s: del)] = deleted
            res = max(res, ans2)
            return deleted
        }
    }

    func longestSubarray(_ nums: [Int]) -> Int {
        let sum = nums.reduce(0) { $0+$1 }
        if sum == nums.count {
            return sum-1
        }
        solve(nums, nums.count-1, false)
        return res
    }
}