class Solution {
    func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
        var g = Array(repeating: [Int](), count: n)
        var apple = Array(repeating: false, count: n)
        var res = 0
        for e in edges {
            g[e[0]].append(e[1])
            g[e[1]].append(e[0])
        }
        gatherApple(-1, 0)
        print(apple)
        dfs(-1, 0)
        return res

        func gatherApple(_ from: Int, _ i: Int) -> Bool {
            apple[i] = hasApple[i]
            for v in g[i] {
                if v == from {
                    continue
                }
                let sonHasApple = gatherApple(i, v)
                apple[i] = apple[i] || sonHasApple
            }
            return apple[i]
        }

        func dfs(_ from: Int, _ i: Int) {
            for x in g[i] {
                if x == from {
                    continue
                }
                if apple[x] {
                    res += 2
                    dfs(i, x)
                }
            }
        }
    }
}