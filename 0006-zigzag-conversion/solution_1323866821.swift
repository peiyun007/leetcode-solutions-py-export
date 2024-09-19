class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        let sArr = Array(s)
        let n = sArr.count
        let r = numRows
        if r == 1 || r >= n {
            return s
        }
        let t = r + r - 2
        let c = (n + t - 1) / t * (1+r-2)
        var mat: [[Character]] = Array(repeating: Array(repeating: Character("-"), count: c), count: r)
        var x = 0, y = 0
        for (i, ch) in sArr.enumerated() {
            mat[x][y] = ch
            if i % t < r - 1 {
                x += 1
            } else {
                x -= 1
                y += 1
            }
        }
        var ans = [Character]()
        for i in 0..<mat.count {
            for j in 0..<mat[0].count {
                if mat[i][j] != "-" {
                    ans.append(mat[i][j])
                }
            }
        }
        return String(ans)
    }
}