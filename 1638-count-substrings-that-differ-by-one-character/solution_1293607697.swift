class Solution {
    func countSubstrings(_ s: String, _ t: String) -> Int {
        let sArr = Array(s)
        let tArr = Array(t)
        let m = sArr.count, n = tArr.count
        var dpl = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
        var dpr = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
        for i in 0..<m {
            for j in 0..<n {
                if sArr[i] == tArr[j] {
                    dpl[i+1][j+1] = dpl[i][j] + 1
                } else {
                    dpl[i+1][j+1] = 0
                }
            }
        }
        for i in (0..<m).reversed() {
            for j in (0..<n).reversed() {
                if sArr[i] == tArr[j] {
                    dpr[i][j] = dpr[i+1][j+1] + 1
                } else {
                    dpr[i][j] = 0
                }
            }
        }
        var ans = 0
        for i in 0..<m {
            for j in 0..<n {
                if sArr[i] != tArr[j] {
                    ans += (dpl[i][j] + 1) * (dpr[i+1][j+1] + 1)
                }
            }
        }
        return ans
    }
}