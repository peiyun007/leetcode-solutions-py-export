class Solution {
    var visited = [Bool]()
    var onPath = [Bool]()
    var hasCycle = false
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        visited = Array(repeating: false, count: numCourses)
        onPath = Array(repeating: false, count: numCourses)
        var graph = Array(repeating: [Int](), count: numCourses)
        for pq in prerequisites {
            var arr = graph[pq[1]]
            arr.append(pq[0])
            graph[pq[1]] = arr
        }
        for i in 0..<numCourses {
            dfs(graph, i)
            if hasCycle {
                return false
            }
        }
        return true
    }

    // 返回是否有环
    func dfs(_ graph: [[Int]], _ i: Int) {
        if hasCycle {
            return
        }
        if onPath[i] {
            hasCycle = true
            return
        }
        if visited[i] {
            return
        }
        visited[i] = true
        onPath[i] = true
        for neighbor in graph[i] {
            dfs(graph, neighbor)
        }
        onPath[i] = false
    }
}