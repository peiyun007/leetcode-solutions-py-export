class Solution {
    func numTilePossibilities(_ tiles: String) -> Int {
        let MX = 8
        let sArr = Array(tiles)
        let n = sArr.count 
        var c = Array(repeating: Array(repeating: 0, count:MX), count: MX)
        c[0][0] = 1
        for i in 1..<MX {
            c[i][0] = 1
            c[i][i] = 1
            for j in 1..<i {
                c[i][j] = c[i-1][j-1] + c[i-1][j]
            }
        }
        var cnt = [Character: Int]()
        for ch in sArr {
            cnt[ch, default: 0] += 1
        }
        let m = cnt.count
        var f = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
        f[0][0] = 1
        var i = 1
        for (ch, ct) in cnt {
            for j in 0...n {
                for k in 0...j where k <= ct {
                    f[i][j] += f[i-1][j-k] * c[j][k]
                }
            }
            i += 1
        }
        var res = 0
        for j in 1...n {
            res += f[m][j]
        }
        return res
    }
}