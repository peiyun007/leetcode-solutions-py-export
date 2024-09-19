class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        let sArr = Array(s)
        let tArr = Array(t)
        let m = sArr.count, n = tArr.count
        var i = 0, j = 0
        while i < m && j < n {
            if sArr[i] == tArr[j] {
                i += 1
                j += 1
            } else {
                j += 1
            }
        }
        return i == m
    }
}