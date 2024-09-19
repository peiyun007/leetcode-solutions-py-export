class Solution {
    func maxSubarraySumCircular(_ nums: [Int]) -> Int {
        var maxsum = Int.min, currentsum1 = 0, minsum = Int.max, currentsum2 = 0
        var totalsum = 0
        for num in nums {
            totalsum += num
            currentsum1 = max(currentsum1+num, num)
            maxsum = max(maxsum, currentsum1)
            currentsum2 = min(currentsum2+num, num)
            minsum = min(minsum, currentsum2)
        }
        return totalsum == minsum ? maxsum : max(maxsum, totalsum-minsum)
    }
}