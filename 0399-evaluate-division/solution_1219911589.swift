class Solution {
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var g = [String: [String: Double]]()
        for (idx, eq) in equations.enumerated() {
            var map1 = g[eq[0]] ?? [String: Double]()
            map1[eq[1]] = values[idx]
            g[eq[0]] = map1

            var map2 = g[eq[1]] ?? [String: Double]()
            map2[eq[0]] = 1.0 / values[idx]
            g[eq[1]] = map2
        }

        var ans = [Double]()
        for query in queries {
            let f = query[0]
            let s = query[1]
            if g[f] == nil || g[s] == nil {
                ans.append(-1.0)
                continue
            }
            var visited = Set<String>()
            let z = divide(g, f, s, &visited)
            ans.append(z)
        }
        return ans
    }

    func divide(_ g: [String: [String: Double]], _ a: String, _ b: String, _ visited: inout Set<String>) -> Double {
        if a == b {
            return 1.0
        }
        if let x2 = g[a]?[b] {
            return x2
        }
        guard let mapA = g[a] else {
            return -1.0
        }
    
        visited.insert(a)
        for (c, val) in mapA {
            if visited.contains(c) {
                continue
            }
            let x = val
            let y = divide(g, c, b, &visited)
            if y > 0 {
                return x * y
            }
        }
        return -1.0
    }
}