class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var indegree = Array(repeating: 0, count: numCourses)
        var graph = Array(repeating: [Int](), count: numCourses)
        for pq in prerequisites {
            var arr = graph[pq[1]]
            arr.append(pq[0])
            graph[pq[1]] = arr
            indegree[pq[0]] += 1
        }
        var queue = [Int]()
        var count = 0
        for i in 0..<numCourses {
            if indegree[i] == 0 {
                queue.append(i)
            }
        }
        while !queue.isEmpty {
            let v = queue.removeFirst()
            count += 1
            for t in graph[v] {
                indegree[t] -= 1
                if indegree[t] == 0 {
                    queue.append(t)
                }
            }
        }
        return count == numCourses
    }

}