class Solution {
    func maxChunksToSorted(_ arr: [Int]) -> Int {
        var stack = [Int]()
        for (i, x) in arr.enumerated() {
            if stack.isEmpty || x >= stack[stack.count-1] {
                stack.append(x)
            } else {
                let mx = stack.removeLast()
                while !stack.isEmpty && x < stack[stack.count-1] {
                    stack.removeLast()
                }
                stack.append(mx)
            }
        }
        return stack.count
    }
}