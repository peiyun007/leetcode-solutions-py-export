class Solution {
    var parents = [Int: Int]()
    var connectedCount = 0
    
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
        if px == py {
            return
        }
        if px < py {
            (px, py) = (py, px)
        }
        parents[px] = py
        connectedCount -= 1
    }
    
    func minSwapsCouples(_ row: [Int]) -> Int {
        connectedCount = row.count / 2
        for i in stride(from: 0, to: row.count, by: 2) {
            union(row[i] / 2, row[i+1] / 2)
        }
        return row.count / 2 - connectedCount
    }
}