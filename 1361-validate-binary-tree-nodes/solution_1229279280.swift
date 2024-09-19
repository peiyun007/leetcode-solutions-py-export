
class Solution {
    func validateBinaryTreeNodes(_ n: Int, _ leftChild: [Int], _ rightChild: [Int]) -> Bool {
        var noCycle = true
        let uf = UnionFind(n)
        //由于并查集只能判断是否在同一个集合中，可能会出现一个节点有两个parents的情况,所以要做验证
        var indegrees = Array(repeating: 0, count: n)
        for i in 0..<n where noCycle {
            if leftChild[i] != -1 {
                indegrees[leftChild[i]] += 1
                if indegrees[leftChild[i]] > 1 {
                    return false
                }
                uf.union(i, leftChild[i], &noCycle)
            }
        }
         for i in 0..<n where noCycle {
            if rightChild[i] != -1 {
                indegrees[rightChild[i]] += 1
                if indegrees[rightChild[i]] > 1 {
                    return false
                }
                uf.union(i, rightChild[i], &noCycle)
            }
        }
        if uf.getCount() > 1 {
            return false
        }
        return noCycle
    }
}

class UnionFind {
    private var parent: [Int]
    private var count: Int

    init(_ n: Int) {
        parent = Array(repeating: 0, count: n)
        count = n
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

    //如果两个节点已经有相同的父母了，这时候再进行一次合并操作，说明是在一个连通集合中再加入一条边，说明已经有环了。
    func union(_ x: Int, _ y: Int, _ noCycle: inout Bool) {
        var px = find(x)
        var py = find(y)
        if px == py {
            noCycle = false
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