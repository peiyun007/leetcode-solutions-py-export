class Solution {
    // 参考：花花酱
    struct Pair<T: Hashable, U: Hashable, V: Hashable>: Hashable {
        let f: T
        let s: U
        let t: V
    }
    var memo = [Pair<Int, Int, Int>: Int]()
    func cherryPickup(_ grid: [[Int]]) -> Int {
        let n = grid.count
        return max(0, dfs(grid, n-1, n-1, n-1))
    }

    func dfs(_ grid: [[Int]], _ x1: Int, _ y1: Int, _ x2: Int) -> Int {
        let y2 = x1+y1-x2
        if x1 < 0 || x2 < 0 || y1 < 0 || y2 < 0 {
            return -1
        }
        if grid[x1][y1] < 0 || grid[x2][y2] < 0 {
            return -1
        }
        if x1 == 0 && y1 == 0 {
            return grid[x1][y1]
        }
        if let val = memo[Pair(f: x1, s: x2, t: y1)] {
            return val
        }
        var res = max(dfs(grid, x1-1, y1, x2-1), dfs(grid, x1-1, y1, x2), 
        dfs(grid, x1, y1-1, x2), dfs(grid, x1, y1-1, x2-1))
        if res < 0 {
            memo[Pair(f: x1, s: x2, t: y1)] = -1
            return -1
        }
        res += grid[x1][y1]
        if x2 != x1 {
            res += grid[x2][y2]
        }
        memo[Pair(f: x1, s: x2, t: y1)] = res
        return res
    }
}