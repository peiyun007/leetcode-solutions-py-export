class Solution {
    func numTrees(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }
        var g = Array(repeating: 0, count: n+1)
        g[0] = 1
        g[1] = 1
        for i in 2...n {
            for j in 1...i {
                g[i] += g[j-1] * g[i-j]
            }
        }
        return g[n]
    }
}