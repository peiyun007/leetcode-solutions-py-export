class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        let n = heights.count
        var left = Array(repeating: 0, count: n)
        var stack = [Int]()
        for i in 0..<n {
            let x = heights[i]
            while !stack.isEmpty && x <= heights[stack[stack.count-1]] {
                stack.removeLast()
            }
            left[i] = (stack.isEmpty ? -1 : stack[stack.count-1])
            
            stack.append(i)
        }
        stack = [Int]()
        var right = Array(repeating: n, count: n)
        for i in 0..<n {
            let x = heights[i]
            while !stack.isEmpty && x < heights[stack[stack.count-1]] {
                let prev = stack.removeLast()
                right[prev] = i
            }
            stack.append(i)
        }
        var ans = 0
        for i in 0..<n {
            ans = max(ans, ((right[i]-1) - (left[i]+1) + 1) * heights[i])
        }
        return ans
    }
}