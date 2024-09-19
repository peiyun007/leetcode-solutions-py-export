class Solution {
    func reverseWords(_ s: String) -> String {
        var res = ""
        var local = ""
        for ch in s {
            if ch == " " {
                res += local
                res += " "
                local = ""
            } else {
                local = String(ch) + local
            }
        }
        res += local
        return res
    }
}