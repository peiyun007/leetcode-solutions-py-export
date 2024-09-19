class Solution {
    func numSimilarGroups(_ strs: [String]) -> Int {
        let uf = UnionFind(strs.count)
        for i in 0..<strs.count {
            for j in i+1..<strs.count {
                let s1 = strs[i]
                let s2 = strs[j]
                if isSimilar(Array(s1), Array(s2)) {
                    uf.union(i, j)
                }
            }
        }
        return uf.getCount()
    }

    func isSimilar(_ str1: [Character], _ str2: [Character]) -> Bool {
        var count = 0
        for i in 0..<str1.count {
            if str1[i] != str2[i] {
                count += 1
            }
        }
        return count == 0 || count == 2
    }
}

class UnionFind {
    private var parent: [Int]
    private var size: [Int]
    private var count: Int

    init(_ n: Int) {
        parent = Array(repeating: 0, count: n)
        size = Array(repeating: 0, count: n)
        count = n
        for i in 0..<n {
            parent[i] = i
            size[i] = 1
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
    func union(_ x: Int, _ y: Int) {
        var px = find(x)
        var py = find(y)
        if px == py {
            return
        }
        if size[px] > size[py] {
            (px, py) = (py, px)
        }
        parent[px] = py
        size[py] += size[px]
        count -= 1
    }

    func getCount() -> Int {
        return count
    }
}