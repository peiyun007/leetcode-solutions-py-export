class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        var product = 1
        var j = 0
        var ans = 0
        for i in 0..<nums.count {
            product *= nums[i]
            while j <= i && product >= k {
                product /= nums[j]
                j += 1
            }
            ans += (i-j+1)
        }
        return ans
    }
}