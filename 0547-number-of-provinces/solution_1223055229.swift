class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        let n = isConnected.count
        var visited = Array(repeating: false, count: n)
        var color = 0

        for i in 0..<n {
            if !visited[i] {
                dfs(isConnected, &visited, i, n)
                color += 1
            }
        }
        return color
    }

    func dfs(_ isConnected: [[Int]], _ visited: inout [Bool], _ i: Int, _ n: Int) {
        if visited[i] {
            return
        }
        visited[i] = true
        for j in 0..<n {
            if isConnected[i][j] == 1 && !visited[j] {
                dfs(isConnected, &visited, j, n)
            }
        }
    }
}