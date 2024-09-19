class Solution {
    private let M = 61
    func isPrintable(_ targetGrid: [[Int]]) -> Bool {
        let m = targetGrid.count
        let n = targetGrid[0].count
        var top = Array(repeating: Int.max, count: M)
        var left = Array(repeating: Int.max, count: M)
        var bottom = Array(repeating: 0, count: M)
        var right = Array(repeating: 0, count: M)
        var queue = [Int]()
        var occur = Set<Int>()

        for i in 0..<m {
            for j in 0..<n {
                let color = targetGrid[i][j]
                occur.insert(color)
                top[color] = min(top[color], i)
                left[color] = min(left[color], j)
                bottom[color] = max(bottom[color], i)
                right[color] = max(right[color], j)
            }
        }

        var g = Array(repeating: Array(repeating: false, count: M), count: M)
        var degree = Array(repeating: 0, count: M)
        var nodes = occur.count
        for outside in occur {
            for i in top[outside]...bottom[outside] {
                for j in left[outside]...right[outside] {
                    let color = targetGrid[i][j]
                    if color != outside && !g[outside][color] {
                        g[outside][color] = true
                        degree[color] += 1
                    }
                }
            }
        }

        for c in occur {
            if degree[c] == 0 {
                queue.append(c)
            }
        }
        while !queue.isEmpty {
            let u = queue.removeFirst()
            nodes -= 1
            for v in 0..<M {
                if g[u][v] {
                    degree[v] -= 1
                    if degree[v] == 0 {
                        queue.append(v)
                    }
                }
            }
        }
        return nodes == 0
    }
}