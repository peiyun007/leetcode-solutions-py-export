class Solution {
    func maxWidthRamp(_ nums: [Int]) -> Int {
        let n = nums.count
        var stack = [Int]()
        stack.append(0)
        for i in 1..<n {
            let x = nums[i]
            if x < nums[stack[stack.count-1]] {
                stack.append(i)
            }
        }
        var res = 0
        for i in (0..<n).reversed() {
            let x = nums[i]
            while !stack.isEmpty && x >= nums[stack[stack.count-1]] {
                res = max(res, i-stack[stack.count-1])
                stack.removeLast()
            }
        }
        return res
    }
}