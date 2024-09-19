class Solution {
    var parent = [Int: Int]()
    func find(_ x: Int) -> Int {
        let px = parent[x] ?? x
        if px == x {
            return x
        }
        parent[x] = find(px)
        return parent[x] ?? x
    }
    
    func union(_ x: Int, _ y: Int) {
        var px = find(x)
        var py = find(y)
        if px < py {
            (px, py) = (py, px)
        }
        parent[px] = py
    }
    
    func check(_ edges: [[Int]], _ toRemove: [Int]) -> Bool {
        for edge in edges {
            if toRemove == edge {
                continue
            }
            let px = find(edge[0])
            let py = find(edge[1])
            if px == py {
                return false
            } else {
                union(px, py)
            }
        }
        return true
    }
    
    func findRedundantDirectedConnection(_ edges: [[Int]]) -> [Int] {
        var indegrees = [Int: Int]()
        var destEdge: [Int]?
        for edge in edges {
            let degree = (indegrees[edge[1]] ?? 0) + 1
            indegrees[edge[1]] = degree
            if degree == 2 {
                destEdge = edge
                break
            }
        }
        parent.removeAll()
        if let destEdge {
            if check(edges, destEdge) {
                return destEdge
            } else {
                for e in edges {
                    if e[1] == destEdge[1] {
                        return e
                    }
                }
            }
        }
        parent.removeAll()
        for edge in edges {
            let px = find(edge[0])
            let py = find(edge[1])
            if px == py {
                return edge
            } else {
                union(px, py)
            }
        } 
        return []
        
    }
}