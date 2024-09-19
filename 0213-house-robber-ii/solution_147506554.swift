class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }
        return max(rob(nums, 0, nums.count - 2), rob(nums, 1, nums.count - 1))
    }
    func rob(_ nums:[Int], _ lo: Int, _ hi: Int) -> Int {
        var a = 0
        var b = 0
        for i in lo...hi {
            if i % 2 == 0 {
                a = max(a + nums[i], b)
            } else {
                b = max(b + nums[i], a)
            }
        }
        return max(a, b)
    }
}