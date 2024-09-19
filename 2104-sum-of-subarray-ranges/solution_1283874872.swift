class Solution {
    func subArrayRanges(_ nums: [Int]) -> Int {
        let x = sumSubarrayMins(nums)
        let y = sumSubarrayMaxs(nums)
        return y - x
    }

    // sumSubarrayMins是Leetcode 907
    func sumSubarrayMins(_ arr: [Int]) -> Int {
        let n = arr.count
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
            ans = (ans + arr[i] * (i-left[i]) * (right[i]-i))
        }
        return ans
    }

    func sumSubarrayMaxs(_ arr: [Int]) -> Int {
        let n = arr.count
        var stack = [Int]()
        var left = Array(repeating: -1, count: n)
        for i in 0..<n {
            let x = arr[i]
            while !stack.isEmpty && arr[stack[stack.count-1]] <= x {
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
            while !stack.isEmpty && arr[stack[stack.count-1]] < x {
                stack.removeLast()
            }
            if !stack.isEmpty {
                right[i] = stack[stack.count-1]
            }
            stack.append(i)
        }
        var ans = 0
        for i in 0..<n {
            ans = (ans + arr[i] * (i-left[i]) * (right[i]-i))
        }
        return ans
    }
}