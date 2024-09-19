class Solution {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var stack = [Int]()
        var res = Array(repeating: -1, count: n)
        for i in 0..<2*n {
            let x = nums[i%n]
            while !stack.isEmpty && x > nums[stack[stack.count-1]] {
                let prev = stack.removeLast()
                if res[prev] == -1 {
                    res[prev] = x
                }
            }
            stack.append(i%n)
        }
        return res
    }
}
