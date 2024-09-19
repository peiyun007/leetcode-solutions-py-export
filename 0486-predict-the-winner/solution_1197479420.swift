class Solution {
    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let f: T
        let s: U
    }

    var memo = [Pair<Int, Int>: Int]()

    func getScore(_ nums: [Int], _ l: Int, _ r: Int) -> Int {
        if l == r {
            return nums[l]
        }
        if let val = memo[Pair(f: l, s: r)] {
            return val
        }
        let ans = max(nums[l] - getScore(nums, l+1, r), nums[r] - getScore(nums, l, r-1))
        memo[Pair(f: l, s: r)] = ans
        return ans
    }

    func predictTheWinner(_ nums: [Int]) -> Bool {
        return getScore(nums, 0, nums.count-1) >= 0 
    }
}