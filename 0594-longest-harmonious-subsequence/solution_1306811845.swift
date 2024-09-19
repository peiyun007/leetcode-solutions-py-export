class Solution {
    func findLHS(_ nums0: [Int]) -> Int {
        let nums = nums0.sorted()
        let n = nums.count
        var j = 0
        var ans = 0
        for i in 0..<n {
            while i > j && nums[i]-nums[j] > 1 {
                j += 1
            }
            if nums[i] - nums[j] == 1 {
                ans = max(ans, i-j+1)
            }
        }
        return ans
    }
}