class Solution {
    func countPalindromicSubsequences(_ s: String) -> Int {
        let mod = Int(1e9+7)
        let sArr = Array(s)
        let n = sArr.count
        var f = Array(repeating: Array(repeating: 0, count: n), count: n)
        var l = Array(repeating: -1, count: 4)
        var r = Array(repeating: -1, count: 4)
        for i in (0..<n).reversed() {
            let ch = sArr[i]
            let chx = getInt(ch)
            l[chx] = i
            r = Array(repeating: -1, count: 4)
            for j in i..<n {
                let chj = sArr[j]
                let chy = getInt(chj)
                r[chy] = j
                for k in 0..<4 {
                    let lk = l[k]
                    let rk = r[k]
                    if lk == -1 || rk == -1 {
                        continue
                    }
                    if lk == rk {
                        f[i][j] = (f[i][j] + 1) % mod
                    } else if lk == rk-1 {
                        f[i][j] = (f[i][j] + 2) % mod
                    } else {
                        f[i][j] = (f[i][j] + f[lk+1][rk-1] + 2) % mod
                    }
                }
            }
        }
        return f[0][n-1]
    }

    func getInt(_ ch: Character) -> Int {
        return Int(ch.asciiValue ?? 0) - Int(Character("a").asciiValue ?? 0)
    }
}