class Solution {
    func minSubArrayLen(_ target0: Int, _ nums: [Int]) -> Int {
        var sum = Array(repeating: 0, count: nums.count + 1)
        for i in 1...nums.count {
            sum[i] = sum[i-1] + nums[i-1]
        }
        var minLen = Int.max
        for i in 0..<nums.count {
            let target = target0 + sum[i]
            let find = binary_search(sum, target)
            if find == -1 {
                continue
            }
            minLen = min(minLen, find - 1 - i + 1)
        }
        return minLen == Int.max ? 0 : minLen
    }

    func binary_search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count
        while l < r {
            let mid = l + (r - l) / 2
            if nums[mid] >= target {
                r = mid
            } else {
                l = mid + 1
            }
        }
        if l == nums.count {
            return -1
        }
        return nums[l] >= target ? l : -1
    }
}