class Solution {
    func maxSumMinProduct(_ nums: [Int]) -> Int {
        let n = nums.count
        let mod = 1_0000_0000_7
        var preSum = Array(repeating: Int64(0), count: n+1)
        for i in 1...n {
            preSum[i] = preSum[i-1] + Int64(nums[i-1])
        }
        var stack = [Int]()
        var left = Array(repeating: -1, count: n)
        for i in 0..<n {
            let x = nums[i]
            while !stack.isEmpty && nums[stack[stack.count-1]] >= x {
                stack.removeLast()
            }
            if !stack.isEmpty {
                left[i] = stack[stack.count-1]
            }
            stack.append(i)
        }
        stack = []
        var right = Array(repeating: n, count: n)
        for i in (0..<n).reversed() {
            let x = nums[i]
            while !stack.isEmpty && nums[stack[stack.count-1]] > x {
                stack.removeLast()
            }
            if !stack.isEmpty {
                right[i] = stack[stack.count-1]
            }
            stack.append(i)
        }
        var maxMinProduct: Int64 = 0
        for i in 0..<n {
            let subarraySum = (preSum[right[i]] - preSum[left[i]+1])
            let minProduct = (subarraySum * Int64(nums[i]))
            maxMinProduct = max(maxMinProduct, minProduct)
        }
        return Int(maxMinProduct) % mod
    }
}