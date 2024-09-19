class Solution {
    func mctFromLeafValues(_ arr: [Int]) -> Int {
        let n = arr.count
        var stack = [Int]()
        var res = 0
        for i in 0..<n {
            let x = arr[i]
            while !stack.isEmpty && stack[stack.count-1] <= x {
                let y = stack.removeLast()
                if stack.isEmpty || stack[stack.count-1] > x {
                    res += x * y
                } else {
                    res += stack[stack.count-1] * y
                }
            }
            stack.append(x)
        }
        while stack.count >= 2 {
            let x = stack.removeLast()
            res += stack[stack.count-1] * x
        }
        return res
    }
}