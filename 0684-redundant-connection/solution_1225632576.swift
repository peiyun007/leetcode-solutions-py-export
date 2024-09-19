class Solution {
    var parent = [Int: Int]()
    func find(_ x: Int) -> Int {
        let px = parent[x] ?? x
        if x == px {
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
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        for edge in edges {
            let x = edge[0]
            let y = edge[1]
            let px = find(x)
            let py = find(y)
            if px != py {
                union(px, py)
            } else {
                return edge
            }
        }
        return []
    }
}