class Solution {
    func calPoints(_ ops: [String]) -> Int {
        var stack = [Int]()
        var sum = 0
        for ch in ops {
            switch ch {
            case "C":
                let x = stack.removeLast()
                sum -= x
            case "D":
                if let x = stack.last {
                    stack.append(x * 2)
                    sum += x * 2
                }
            case "+":
                if stack.count >= 2 {
                    let x = stack[stack.count - 1]
                    let y = stack[stack.count - 2]
                    stack.append(x + y)
                    sum += (x + y)
                }
            default:
                if let x = Int(ch) {
                    stack.append(x)
                    sum += x
                }
            }
        }
        return sum
    }
}