class Solution {
    func longestWPI(_ hours: [Int]) -> Int {
        let n = hours.count
        var preSum = Array(repeating: 0, count: n+1)
        var stack = [Int]()
        stack.append(0)
        for i in 1...n {
            preSum[i] = preSum[i-1] + (hours[i-1] > 8 ? 1 : -1)
            let x = preSum[i]
            if stack.isEmpty || x < preSum[stack[stack.count-1]] {
                stack.append(i)
            }
        }
        var res = 0
        for i in (1...n).reversed() {
            let x = preSum[i]
            while !stack.isEmpty && x > preSum[stack[stack.count-1]] {
                res = max(res, i-stack[stack.count-1])
                stack.removeLast()
            }
        }
        return res
    }
}