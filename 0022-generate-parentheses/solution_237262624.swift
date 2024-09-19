class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var res = [String]()
        var temp = ""
        let parenthesis: [Character] = ["(", ")"]
        dfs(&res, &temp, n*2, parenthesis)
        return res
    }
    
    private func dfs(_ res: inout [String], _ temp: inout String, _ count: Int, _ parenthesis: [Character]) {
        if count == 0 {
            if isValid(temp) {
                res.append(temp)
            }
            return
        }
        for i in 0..<2 {
            temp.append(parenthesis[i])
            dfs(&res, &temp, count - 1, parenthesis)
            temp.removeLast()
        }
    }
    
    private func isValid(_ s: String) -> Bool {
        let chars = Array(s)
        var stack = [Character]()
        for ch in chars {
            if ch == "(" {
                stack.append(")")
            } else {
                if stack.isEmpty || stack.last != ch {
                    return false
                } else {
                    stack.removeLast()
                }
            }
        }
        return stack.isEmpty
    }
}
