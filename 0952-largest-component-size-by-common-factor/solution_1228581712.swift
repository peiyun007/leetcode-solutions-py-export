class Solution {
    func largestComponentSize(_ nums: [Int]) -> Int {
        let uf = UnionFind((nums.max() ?? 0) + 1)
        for num in nums {
            var i = 2
            while i * i <= num {
                if num % i == 0 {
                    uf.union(num, i)
                    uf.union(num, num / i)
                }
                i += 1
            }
        }
        var ans = 0
        var count = [Int: Int]()
        for num in nums {
            let p = uf.find(num)
            let x = (count[p] ?? 0) + 1
            count[p] = x
            ans = max(ans, x)
        }
        return ans
    }
}

class UnionFind {
    private var parent: [Int]
    private var size: [Int]
    
    init(_ n: Int) {
        parent = Array(repeating: 0, count: n)
        size = Array(repeating: 0, count: n)
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
        size[py] += size[px]
        parent[px] = py
    }

    //不能用这里的
    func getMaxSize() -> Int {
        return size.max() ?? 0
    }
}