class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var start = 0
        var preLen = 0
        for ch in s {
            if ch == " " {
                start = 0
            } else {
                start += 1
                preLen = start
            }
        }
        return preLen
    }
}