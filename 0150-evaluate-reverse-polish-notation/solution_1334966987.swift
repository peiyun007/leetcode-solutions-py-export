class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        for token in tokens {
            if let num = Int(token) {
                stack.append(num)
            } else {
                let num2 = stack.removeLast()
                let num1 = stack.removeLast()
                switch token {
                case "+":
                    stack.append(num1+num2)
                case "-":
                    stack.append(num1-num2)
                case "*":
                    stack.append(num1*num2)
                case "/":
                    stack.append(num1/num2)
                default:
                    break
                }
            }
        }
        return stack[0]
    }
}