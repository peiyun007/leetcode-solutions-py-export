class Solution {
    func simplifyPath(_ path: String) -> String {
        let arr = path.split(separator: "/")
        var stack = [String]()
        for nm in arr {
            if nm == ".." {
                if !stack.isEmpty {
                    stack.removeLast()
                }
            } else if !nm.isEmpty && nm != "." {
                stack.append(String(nm))
            }
        }
        return "/" + stack.joined(separator: "/")
    }
}