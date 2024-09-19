class Solution {
    func canSeePersonsCount(_ heights: [Int]) -> [Int] {
        let n = heights.count
        var res = Array(repeating: 0, count: n)
        var stack = [Int]()
        for i in (0..<n).reversed() {
            let h = heights[i]
            while !stack.isEmpty && h > stack[stack.count-1] {
                res[i] += 1
                stack.removeLast()
            }
            if !stack.isEmpty {
                res[i] += 1
            }
            stack.append(h)
        }
        return res
    }
}