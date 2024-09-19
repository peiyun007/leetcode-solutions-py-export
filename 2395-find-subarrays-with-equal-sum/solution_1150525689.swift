class Solution {
    func findSubarrays(_ nums: [Int]) -> Bool {
        var map = [Int: Bool]()
        for i in 1..<nums.count {
            let sum = nums[i] + nums[i-1]
            if let cnt = map[sum] {
                return true
            }
            map[sum] = true
        }
        return false
    }
}