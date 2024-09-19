class Solution {
    // 参考：花花酱
    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let f: T
        let s: U
    }
    func shortestPathLength(_ graph: [[Int]]) -> Int {
        let m = graph.count
        var visited = Array(repeating: Array(repeating: 0, count: 1 << m), count: m)
        var queue = [(Int, Int, Int)]()
        let kAns = 1 << m - 1
        for i in 0..<graph.count {
            queue.append((i, 1 << i, 0))
            visited[i][1 << i] = 1
        }
        while !queue.isEmpty {
            var size = queue.count
            let (cur, state, steps) = queue.removeFirst()
            if state == kAns {
                return steps
            }
            for node in graph[cur] {
                let nextState = state | 1 << node
                if visited[node][nextState] == 0 {
                    queue.append((node, nextState, steps+1))
                    visited[node][nextState] = 1
                }
            }
        }
        return -1
    }
}