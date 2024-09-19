class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var preLen = 0
        var len = 0
        for ch in s {
            if ch == " " {
                len = 0
            } else {
                len += 1
                preLen = len
            }
        }
        return preLen
    }
}