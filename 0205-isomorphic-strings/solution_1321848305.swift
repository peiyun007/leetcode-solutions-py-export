class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        let sArr = Array(s)
        let tArr = Array(t)
        var s2t = [Character: Character]()
        var t2s = [Character: Character]()
        let n = sArr.count
        for i in 0..<n {
            let x = sArr[i]
            let y = tArr[i]
            if s2t[x] != nil && s2t[x] != y {
                return false
            }
            if t2s[y] != nil && t2s[y] != x {
                return false
            }
            s2t[x] = y
            t2s[y] = x
        }
        return true
    }
}