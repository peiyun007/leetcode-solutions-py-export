class Solution {
    func minimumFuelCost(_ roads: [[Int]], _ seats: Int) -> Int {
        let n = roads.count + 1
        var g = Array(repeating: [Int](), count: n)
        for e in roads {
            g[e[0]].append(e[1])
            g[e[1]].append(e[0])
        }
        var ans = 0
        dfs(0, -1)
        return ans
        
        func dfs(_ x: Int, _ from: Int) -> Int {
            var size = 1
            for y in g[x] {
                if y != from {
                    size += dfs(y, x)
                }
            }
            if x != 0 {
                ans += ((size - 1) / seats + 1)    //ceilf
            }
            return size
        }
    }
}