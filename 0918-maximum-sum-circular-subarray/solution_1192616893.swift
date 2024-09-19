class Solution {

    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let f: T
        let s: U
    }
    var dict = [Pair<Int, Int>: Int]()

    func helper(_ nums: [Int], _ i: Int, _ s: Int) -> Int {
        if i == 0 {
            return nums[i] * s
        }
        if let val = dict[Pair(f: i, s: s)] {
            return val
        }
        let res = nums[i] * s + max(0, helper(nums, i-1, s))
        dict[Pair(f: i, s: s)] = res
        return res
    }

    func maxSubarraySumCircular(_ nums: [Int]) -> Int {
        let sum = nums.reduce(0) { $0+$1 }
        var max_pos = Int.min
        for i in 0..<nums.count {
            max_pos = max(max_pos, helper(nums, i, 1))
        }
        var max_neg = Int.min
        for i in 0..<nums.count {
            max_neg = max(max_neg, helper(nums, i, -1))
        }
        if max_pos < 0 {
            return max_pos
        } else {
            return max(max_pos, sum+max_neg)
        }
    }
}