class Solution {
    func mostProfitablePath(_ edges: [[Int]], _ bob: Int, _ amount: [Int]) -> Int {
        let n = amount.count
        var g = Array(repeating: [Int](), count: n)
        for e in edges {
            g[e[0]].append(e[1])
            g[e[1]].append(e[0])
        }
        var bob_time = Array(repeating: n, count: n)
        dfs_bob(bob, -1, 0)
        g[0].append(-1)  // 防止把根节点当作叶子
        var maxVal = Int.min
        dfs_alice(0, -1, 0, 0)
        return maxVal

        func dfs_bob(_ x: Int, _ from: Int, _ t: Int) -> Bool {
            if x == 0 {
                bob_time[x] = t
                return true
            }
            for y in g[x] {
                if y != from, dfs_bob(y, x, t+1) {
                    bob_time[x] = t
                    return true
                }
            }
            return false
        }

        func dfs_alice(_ x: Int, _ from: Int, _ t: Int, _ sum: Int) {
            var total = sum
            if t < bob_time[x] {
                total += amount[x]
            } else if t == bob_time[x] {
                total += (amount[x] / 2)
            }
            if g[x].count == 1 {
                maxVal = max(maxVal, total)
                return
            }
            for y in g[x] {
                if y != from {
                    dfs_alice(y, x, t+1, total)
                }
            }
        }

    }
}