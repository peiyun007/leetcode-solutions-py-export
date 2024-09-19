class Solution {
    func removeStones(_ stones: [[Int]]) -> Int {
        var uf = UnionFind()
        for stone in stones {
            uf.union(stone[0]+10001, stone[1])
        }
        return stones.count - uf.getCount()
    }
}

class UnionFind {
    private var count = 0
    private var parent = [Int: Int]()

    init() {

    }

    func find(_ x: Int) -> Int {
        if parent[x] == nil {
            parent[x] = x
            count += 1
        }
        var px = parent[x] ?? x
        if px == x {
            return x
        }
        parent[x] = find(px)
        return parent[x] ?? x
    }

    func union(_ x: Int, _ y: Int) {
        var px = find(x)
        var py = find(y)
        if px == py {
            return
        }
        if px < py {
            (px, py) = (py, px)
        }
        parent[px] = py
        count -= 1
    }

    func getCount() -> Int {
        return count
    }
}