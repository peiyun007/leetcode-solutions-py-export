class Solution {
    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let f: T
        let s: U
    }

    func solve(_ nums: [Int], _ index: Int, _ sum: Int, _ memo: inout [Pair<Int, Int>: Int]) -> Int {
        if index >= nums.count {
            if sum == 0 {
                return 0
            } else {
                return Int.min
            }
        }
        if let val = memo[Pair(f: index, s: sum)] {
            return val
        }
        
        let pick = nums[index] + solve(nums, index+1, (sum+nums[index])%3, &memo)
        let notPick = solve(nums, index+1, sum, &memo)
        let res = max(pick, notPick)
        memo[Pair(f: index, s: sum)] = res
        return res
    }

    func maxSumDivThree(_ nums: [Int]) -> Int {
        let sum = nums.reduce(0) {$0+$1}
        var memo = [Pair<Int, Int>: Int]()
        return solve(nums, 0, 0, &memo)
    }
}