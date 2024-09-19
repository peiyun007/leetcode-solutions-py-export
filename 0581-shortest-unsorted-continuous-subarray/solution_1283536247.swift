class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        let n = nums.count
        var maxVal = nums[0], minVal = nums[n-1]
        var begin = 0, end = -1
        for i in 0..<n {
            if nums[i] >= maxVal {
                maxVal = nums[i]
            } else {
                end = i
            }
        }
        for i in (0..<n).reversed() {
            if nums[i] <= minVal {
                minVal = nums[i]
            } else {
                begin = i
            }
        }
        return end-begin+1
    }
}