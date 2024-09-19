class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var ans: Double = Double(Int.min)
        var i = 0
        var sum = 0
        for j in 0..<nums.count {
            let x = nums[j]
            sum += x
            if j-i+1 > k {
                sum -= nums[i]
                i += 1
            }
            if j-i+1 == k {
                ans = max(ans, Double(sum) / Double(k))
            }
        }
        return ans
    }
}