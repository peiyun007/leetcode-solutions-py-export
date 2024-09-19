class Solution {
    func maxFrequency(_ nums: [Int], _ k: Int) -> Int {
        let arr = nums.sorted(by: <)
        var ans = -1
        let n = arr.count
        var preSum = Array(repeating: 0, count: n+1)
        for i in 1...n {
            preSum[i] = preSum[i-1] + arr[i-1]
        }
        for i in 0..<n {
            var l = 0, r = i + 1
            while l < r {
                let mid = l + (r-l) / 2
                let sum = arr[i] * (i-mid+1) - (preSum[i+1] - preSum[mid])
                if sum <= k {
                    r = mid
                } else {
                    l = mid + 1
                }
            }
            ans = max(ans, i - l + 1)
        }
        return ans
    }
}