class Solution {
    func sumSubarrayMins(_ arr: [Int]) -> Int {
        let n = arr.count
        let mod = 1_0000_0000_7
        var stack = [Int]()
        var left = Array(repeating: -1, count: n)
        for i in 0..<n {
            let x = arr[i]
            while !stack.isEmpty && arr[stack[stack.count-1]] >= x {
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
            let x = arr[i]
            while !stack.isEmpty && arr[stack[stack.count-1]] > x {
                stack.removeLast()
            }
            if !stack.isEmpty {
                right[i] = stack[stack.count-1]
            }
            stack.append(i)
        }
        var ans = 0
        for i in 0..<n {
            ans = (ans + arr[i] * (i-left[i]) * (right[i]-i)) % mod
        }
        return ans
    }
}