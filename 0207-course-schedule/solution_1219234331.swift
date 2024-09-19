class Solution {
    var visit = [Int]() // 1: visiting 2: visited
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        visit = Array(repeating: 0, count: numCourses)
        var graph = Array(repeating: [Int](), count: numCourses)
        for pq in prerequisites {
            var arr = graph[pq[1]]
            arr.append(pq[0])
            graph[pq[1]] = arr
        }
        for i in 0..<numCourses {
            if dfs(graph, i) {
                return false
            }
        }
        return true
    }

    // 返回是否有环
    func dfs(_ graph: [[Int]], _ i: Int) -> Bool {
        if visit[i] == 1 {
            return true
        }
        if visit[i] == 2 {
            return false
        }
        visit[i] = 1
        for neighbor in graph[i] {
            if dfs(graph, neighbor) {
                return true
            }
        }
        visit[i] = 2
        return false
    }
}