class Solution {
    // 参考花花酱
    var g = [[Int]]()
    var m = 0
    var n = 0

    func largestIsland(_ grid: [[Int]]) -> Int {
        g = grid
        m = grid.count
        n = grid[0].count
        var area = [Int: Int]()
        var color = 1
        var ans = 0
        let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]

        for i in 0..<m {
            for j in 0..<n {
                if g[i][j] == 1 {
                    color += 1
                    let d = getArea(i, j, color)
                    area[color] = d
                    ans = max(ans, d)
                }
            }
        }

        for i in 0..<m {
            for j in 0..<n {
                if g[i][j] == 0 {
                    var colors = Set<Int>()
                    for dir in dirs {
                        let x = i + dir.0
                        let y = j + dir.1
                        let color = getColor(x, y)
                        if color != 0 {
                            colors.insert(color)
                        }
                    }
                    var d = 1
                    for color in colors {
                        d += (area[color] ?? 0)
                    }
                    ans = max(ans, d)
                }
            }
        }
        return ans
    }

    func getColor(_ x: Int, _ y: Int) -> Int {
        if x < 0 || x >= m || y < 0 || y >= n {
            return 0
        }
        return g[x][y]
    }   

    func getArea(_ x: Int, _ y: Int, _ color: Int) -> Int {
        if x < 0 || x >= m || y < 0 || y >= n || g[x][y] != 1 {
            return 0
        }
        g[x][y] = color
        return 1 + getArea(x-1, y, color) + getArea(x+1, y, color)
        + getArea(x, y-1, color) + getArea(x, y+1, color)
    }
    
}
