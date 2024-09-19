
class LUPrefix {
    let uf: UnionFind
    let n: Int
    var arr: [Bool]
    init(_ n: Int) {
        self.n = n
        uf = UnionFind(n+1)
        arr = Array(repeating: false, count: n+1)
    }
    
    func upload(_ video: Int) {
        arr[video] = true
        if arr[video-1] {
            uf.union(video-1, video)
        }
        if video + 1 <= n && arr[video+1] {
            uf.union(video+1, video)
        }
    }
    
    func longest() -> Int {
        if arr[1] {
            return uf.find(1)
        }
        return 0
    }
}

class UnionFind {
    private var parent: [Int]
    private var size: [Int]
    init(_ n: Int) {
        parent = Array(repeating: 0, count: n)
        size = Array(repeating: 1, count: n)
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

    func union(_ x: Int, _ y: Int) {
        var px = find(x)
        var py = find(y)
        if px == py {
            return
        }
        if px > py {
            (px, py) = (py, px)
        }
        parent[px] = py
        size[py] += size[px]
    }

    func getSize(_ x: Int) -> Int {
        return size[find(x)]
    }
}

/**
 * Your LUPrefix object will be instantiated and called as such:
 * let obj = LUPrefix(n)
 * obj.upload(video)
 * let ret_2: Int = obj.longest()
 */