class Solution {
    func checkIfPrerequisite(_ numCourses: Int, _ prerequisites: [[Int]], _ queries: [[Int]]) -> [Bool] {
        var g = Array(repeating: [Int](), count: numCourses)
        var inDeg = Array(repeating: 0, count: numCourses)
        for e in prerequisites {
            g[e[0]].append(e[1])
            inDeg[e[1]] += 1
        }
        var queue = [Int]()
        var isPre = Array(repeating: Array(repeating: false, count: numCourses), count: numCourses)
        for i in 0..<numCourses {
            if inDeg[i] == 0 {
                queue.append(i)
            }
        }
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            for nxt in g[cur] {
                isPre[cur][nxt] = true
                for i in 0..<numCourses {
                    isPre[i][nxt] = isPre[i][nxt] || isPre[i][cur]
                }
                inDeg[nxt] -= 1
                if inDeg[nxt] == 0 {
                    queue.append(nxt)
                }
            }
        }
        var res = [Bool]()
        for q in queries {
            res.append(isPre[q[0]][q[1]])
        }
        return res
    }
}