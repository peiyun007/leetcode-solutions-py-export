class Solution {
    // 注意对于"udyyek"来说，两个y是不一样的，y1和y2的区别
    func smallestStringWithSwaps(_ s: String, _ pairs: [[Int]]) -> String {
        let uf = UnionFind(s.count)
        var arr = Array(s)
        for pair in pairs {
            uf.union(pair[0], pair[1])
        }
        var map = [Int: [Character]]()
        var indexesMap = [Int: [Int]]()
        for (idx, ch) in arr.enumerated() {
            let p = uf.find(idx)
            map[p, default: [Character]()].append(ch)
            indexesMap[p, default:[Int]()].append(idx)
        }
        for (key, chs) in map {
            let chsSorted = chs.sorted()
            let indice = indexesMap[key] ?? []
            for (idx, ch) in zip(indice, chsSorted) {
                arr[idx] = ch
            }
        }
        return String(arr)
    }
}

class UnionFind {
    var parent: [Int]
    var rank: [Int]
    
    init(_ n: Int) {
        parent = Array(repeating: 0, count: n)
        rank = Array(repeating: 0, count: n)
        for i in 0..<n {
            parent[i] = i
            rank[i] = 1
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
        if rank[px] < rank[py] {
            (px, py) = (py, px)
        }
        rank[px] += rank[py]
        parent[py] = px
    }
}
