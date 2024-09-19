class Solution {
    var parents = [Int: Int]()

    func find(_ x: Int) -> Int {
        let px = parents[x] ?? x
        if px == x {
            return x
        }
        parents[x] = find(px)
        return parents[x] ?? x
    }

    func union(_ x: Int, _ y: Int) {
        var px = find(x)
        var py = find(y)
        if px < py {
            (px, py) = (py, px)
        }
        parents[px] = py
    }

    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        for e in edges {
            union(e[0], e[1])
        }
        return find(source) == find(destination)
    }
}