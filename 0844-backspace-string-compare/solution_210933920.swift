class Solution {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        let s = build(S)
        let t = build(T)
        return s == t
    }
    
    func build(_ S: String) -> String {
        var stack = [Character]()
        for ch in S {
            if ch != "#" {
                stack.append(ch)
            } else if !stack.isEmpty {
                stack.removeLast()
            }
        }
        return String(stack)
    }
}