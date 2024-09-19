class Solution {
    func reverseStr(_ s: String, _ k: Int) -> String {
        var res = ""
        var resInternal = ""
        var reverse = true
        var i = 0
        for ch in s {
            i += 1
            if reverse {
                resInternal = String(ch) + resInternal
            } else {
                resInternal += String(ch)
            }
            if i >= k {
                i = 0
                res += resInternal
                reverse = !reverse
                resInternal = ""
            }
        }
        res += resInternal
        return res
    }
}