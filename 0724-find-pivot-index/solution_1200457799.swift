class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        var l = 0
        let sum = nums.reduce(0) { $0+$1 }
        var r = sum
        for i in 0..<nums.count {
            r -= nums[i]
            if l == r {
                return i
            }
            l += nums[i]
        }
        return -1
    }
}