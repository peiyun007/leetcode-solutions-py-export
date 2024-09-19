class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var maxCurr = nums[0]
        var minCurr = nums[0]
        var maxProduct = nums[0]
        var maxPre = nums[0]
        var minPre = nums[0]
        for i in 1..<nums.count {
            maxCurr = max(max(maxPre * nums[i], minPre * nums[i]), nums[i])
            minCurr = min(min(maxPre * nums[i], minPre * nums[i]), nums[i])
            maxProduct = max(maxProduct, maxCurr)
            maxPre = maxCurr
            minPre = minCurr
        }
        return maxProduct
    }
}