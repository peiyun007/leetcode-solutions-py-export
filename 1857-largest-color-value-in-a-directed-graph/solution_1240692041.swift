class Solution {
    func largestPathValue(_ colorString: String, _ edges: [[Int]]) -> Int {
        let colors = Array(colorString)
        let n = colors.count
        var g = Array(repeating: [Int](), count: n)
        var degree = Array(repeating: 0, count: n)
        var queue = [Int]()
        var f = Array(repeating: Array(repeating: 0, count: 26), count: n)
        for e in edges {
            if e[0] == e[1] {
                return -1
            }
            g[e[0]].append(e[1])
            degree[e[1]] += 1
        }
        for i in 0..<n {
            if degree[i] == 0 {
                queue.append(i)
            }
        }
        var num = 0
        while !queue.isEmpty {
            let u = queue.removeFirst()
            f[u][getColorInt(colors[u])] += 1
            num += 1
            for v in g[u] {
                for c in 0..<26 {
                    f[v][c] = max(f[v][c], f[u][c])
                }
                degree[v] -= 1
                if degree[v] == 0 {
                    queue.append(v)
                }
            }
        }
        if num < n {
            return -1
        }
        var res = 0
        for i in 0..<n {
            res = max(res, f[i].max() ?? 0)
        }
        return res
    }

    func getColorInt(_ c: Character) -> Int {
        return Int(c.asciiValue ?? 0) - Int(Character("a").asciiValue ?? 0)
    }
}