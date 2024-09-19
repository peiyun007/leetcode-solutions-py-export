class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var cnt = [Int: Int]()
        for x in nums {
            cnt[x, default: 0] += 1
        }
        for (x, ct) in cnt {
            if ct >= (nums.count + 1) / 2 {
                return x
            }
        }
        return -1
    }
}