class Solution {
    func minimumHammingDistance(_ source: [Int], _ target: [Int], _ allowedSwaps: [[Int]]) -> Int {
        let n = source.count
        let uf = UnionFind(n)
        for e in allowedSwaps {
            uf.union(e[0], e[1])
        }
        var s = [Int: [Int]]()
        var t = [Int: [Int]]()
        for i in 0..<n {
            let fa = uf.find(i)
            s[fa, default: [Int]()].append(source[i])
            t[fa, default: [Int]()].append(target[i])
        }
        var res = 0
        for i in 0..<n {
            guard var arr_s = s[i], var arr_t = t[i] else { continue }
            for x in arr_s {
                if arr_t.contains(x) {
                    let index = arr_t.firstIndex { $0 == x } ?? 0
                    arr_t.remove(at: index)
                } else {
                    res += 1
                }
            }
        }
        return res
    }
}

class UnionFind {
    private var parent: [Int]
    init(_ n: Int) {
        parent = Array(repeating: 0, count: n)
        for i in 0..<n {
            parent[i] = i
        }
    }

    func find(_ x: Int) -> Int {
        let px = parent[x]
        if px == x {
            return x
        }
        parent[x] = find(px)
        return parent[x]
    }

    func union(_ x: Int, _ y: Int) -> Bool {
        var px = find(x)
        var py = find(y)
        if px == py {
            return false
        }
        if px < py {
            (px, py) = (py, px)
        }
        parent[px] = py
        return true
    }
}