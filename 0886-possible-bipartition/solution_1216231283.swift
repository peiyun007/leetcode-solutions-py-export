class Solution {
    var g = [[Int]]()
    var colors = [Int]()
    func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
        g = Array(repeating: [Int](), count: n)
        for d in dislikes {
            g[d[0]-1].append(d[1]-1)
            g[d[1]-1].append(d[0]-1)
        }
        colors = Array(repeating: 0, count: n)
        for i in 0..<n {
            if colors[i] == 0 && !dfs(i, 1) {
                return false
            } 
        }
        return true
    }
    
    func dfs(_ i: Int, _ color: Int) -> Bool {
        colors[i] = color
        for j in g[i] {
            if colors[j] == color {
                return false
            }
            if colors[j] == 0 && !dfs(j, -color) {
                return false
            }
        }
        return true
    }
}