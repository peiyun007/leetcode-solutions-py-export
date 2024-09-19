class Solution {
    func sumOfDistancesInTree(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var g = Array(repeating: [Int](), count: n)
        for e in edges {
            g[e[0]].append(e[1])
            g[e[1]].append(e[0])
        }
        var ans = Array(repeating: 0, count: n)
        var size = Array(repeating: 1, count: n)
        dfs(0, -1, 0)
        reroot(0, -1)
        return ans

        func dfs(_ x: Int, _ fa: Int, _ depth: Int) {
            ans[0] += depth
            for y in g[x] {
                if y != fa {
                    dfs(y, x, depth+1)
                    size[x] += size[y]
                }
            }
        }

        func reroot(_ x: Int, _ fa: Int) {
            for y in g[x] {
                if y != fa {
                    ans[y] = ans[x] + n - 2 * size[y]
                    reroot(y, x)
                }
            }
        }
    }
}