class Solution {
    func findBestValue(_ arr: [Int], _ target: Int) -> Int {
        let nums = arr.sorted(by: <)
        var ans = 0
        var right = nums.max() ?? 1
        var preSum = Array(repeating: 0, count: nums.count + 1)
        for i in 1...nums.count {
            preSum[i] = preSum[i-1] + nums[i-1]
        }
        var diff = target
        for i in 1...right {
            let index = lowerBound(i)
            let sum = preSum[index] + i * (nums.count - index)
            if abs(sum-target) < diff {
                ans = i
                diff = abs(sum-target)
            }
        }
        return ans

        func lowerBound(_ x: Int) -> Int {
            var left = 0, right = nums.count
            while left < right {
                let mid = left + (right - left) / 2
                if nums[mid] > x {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            return left
        }
    }
}