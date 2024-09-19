class Solution {
    func removeDuplicates(_ S: String) -> String {
        var stack = [Character]()
        for (index, ch) in S.enumerated() {
            if let top = stack.last {
                if top == ch {
                    stack.removeLast()
                } else {
                    stack.append(ch)
                }
            } else {
                stack.append(ch)
            }
        }
        return String(stack)
    }
}