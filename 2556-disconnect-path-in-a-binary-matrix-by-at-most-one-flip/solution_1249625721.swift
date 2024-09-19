class Solution {
    func isPossibleToCutPath(_ grid: [[Int]]) -> Bool {
        var g = grid
        let m = g.count, n = g[0].count
        var res = !dfs(0, 0)
        if res {
            return true
        }
        g[0][0] = 1  //由于第一次dfs的时候将(0,0)位置的元素也置为了0，但是这个位置是不能改变的，一直为1，所以进行还原
        return !dfs(0, 0)

        func dfs(_ x: Int, _ y: Int) -> Bool {
            if x == m-1 && y == n-1 {
                return true
            }
            if x >= m || y >= n {
                return false
            }

            if g[x][y] == 1 {
                g[x][y] = 0
                if dfs(x+1, y) || dfs(x, y+1) {
                    return true
                }
            }
            return false
        }
    }
}