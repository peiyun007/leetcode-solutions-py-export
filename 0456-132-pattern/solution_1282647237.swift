class Solution {
    func find132pattern(_ nums: [Int]) -> Bool {
        let n = nums.count
        var max_k = Int.min
        var stack = [Int]()
        for i in (0..<n).reversed() {
            let x = nums[i]
            if x < max_k {
                return true
            }
            while !stack.isEmpty && x > stack[stack.count-1] {
                max_k = max(max_k, stack.removeLast())
            }
            if x > max_k {
                stack.append(x)
            }
        }
        return false
    }
}