class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var ans = 0
        for i in 0..<nums.count {
            ans ^= nums[i]
        }
        for i in 0...nums.count {
            ans ^= i
        }
        return ans
    }
}