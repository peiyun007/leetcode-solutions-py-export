class Solution {
    func minOperations(_ nums: [Int], _ x: Int) -> Int {
        let n = nums.count
        let sum = nums.reduce(0) { $0+$1 }
        if sum < x {
            return -1
        }
        var right = 0
        var lsum = 0, rsum = sum
        var ans = n+1
        for left in -1..<n {
            if left != -1 {
                lsum += nums[left]
            }
            while right < n && lsum + rsum > x {
                rsum -= nums[right]
                right += 1
            }
            if lsum + rsum == x {
                ans = min(ans, left + 1 + (n-right))
            }
        }
        return ans > n ? -1 : ans
    }
}