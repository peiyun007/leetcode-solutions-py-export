class Solution {
    func reverseString(_ s: String) -> String {
        var res = ""
        for ch in s {
            res = String(ch) + res
        }
        return res
    }
}