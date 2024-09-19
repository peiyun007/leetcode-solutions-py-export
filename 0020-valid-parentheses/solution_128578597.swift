class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        let charArr = [Character](s)
        for char in charArr {
            if char == "(" {
                stack.append(")")
            } else if char == "{" {
                stack.append("}")
            } else if char == "[" {
                stack.append("]")
            } else {
                if stack.isEmpty || stack.last != char {
                    return false
                } else {
                    stack.removeLast()
                }
            }
        }
        return stack.isEmpty
    }
}