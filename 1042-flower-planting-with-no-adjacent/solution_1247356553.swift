class Solution {
    func gardenNoAdj(_ n: Int, _ paths: [[Int]]) -> [Int] {
        var g = Array(repeating: [Int](), count: n)
        for e in paths {
            g[e[0]-1].append(e[1]-1)
            g[e[1]-1].append(e[0]-1)
        }
        var ans = Array(repeating: 0, count: n)
        for i in 0..<n {
            var colors = Array(repeating: false, count: 5)
            for v in g[i] {
                colors[ans[v]] = true
            }
            for j in 1...4 {
                if !colors[j] {
                    ans[i] = j
                    break
                }
            }
        }
        return ans
    }
}