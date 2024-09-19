class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        var p2s = [Character: String]()
        var s2p = [String: Character]()
        let sArr = s.split(separator: " ")
        let pArr = Array(pattern)
        let n = pArr.count
        if pattern.count != sArr.count { return false }
        for i in 0..<n {
            let si = String(sArr[i])
            if let val = p2s[pArr[i]], val != si {
                return false
            }
            if let val = s2p[si], val != pArr[i] {
                return false
            }
            p2s[pArr[i]] = si
            s2p[si] = pArr[i]
        }
        return true
    }
}