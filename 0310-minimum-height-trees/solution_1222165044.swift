class Solution {
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var g = Array(repeating: [Int](), count: n)
        for e in edges {
            var arr1 = g[e[0]]
            arr1.append(e[1])
            g[e[0]] = arr1

            var arr2 = g[e[1]]
            arr2.append(e[0])
            g[e[1]] = arr2
        }
        var parents = Array(repeating: -1, count: n)
        func bfs(_ start: Int) -> Int {
            var queue = [Int]()
            var visited = Array(repeating: false, count: n)
            queue.append(start)
            visited[start] = true

            var farthest = start
            while !queue.isEmpty {
                var x = queue.removeFirst()
                farthest = x
                for y in g[x] {
                    if visited[y] {
                        continue
                    }
                    visited[y] = true
                    queue.append(y)
                    parents[y] = x
                }
            }
            return farthest
        }
        let x = bfs(0)
        var y = bfs(x)
        parents[x] = -1
        var path = [Int]()
        while y != -1 {
            path.append(y)
            y = parents[y]
        }
        if path.count % 2 == 0 {
            return [path[path.count / 2 - 1], path[path.count / 2]]
        } else {
            return [path[(path.count - 1) / 2]]
        }
    }
}