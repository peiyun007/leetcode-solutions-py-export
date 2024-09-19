class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard board.count > 0 && board[0].count > 0 else {
            return false
        }
        let m = board.count
        let n = board[0].count
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        let wordContent = Array(word)
        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == wordContent[0] && dfs(board, wordContent, m, n, i, j, &visited, 0) {
                    return true
                }
            }
        }
        return false
    }
    
    private func dfs(_ board: [[Character]], _ wordContent: [Character], _ m: Int, _ n: Int, _ i: Int, _ j: Int, _ visited: inout [[Bool]], _ index: Int) -> Bool {
        if index == wordContent.count {
            return true
        }
        guard i >= 0 && i < m && j >= 0 && j < n else {
            return false
        }
        guard !visited[i][j] && board[i][j] == wordContent[index] else {
            return false
        }
        visited[i][j] = true
        let match = dfs(board, wordContent, m, n, i - 1, j, &visited, index + 1) || dfs(board, wordContent, m, n, i, j - 1, &visited, index + 1) || dfs(board, wordContent, m, n, i + 1, j, &visited, index + 1) || dfs(board, wordContent, m, n, i, j + 1, &visited, index + 1)
        if match {
            return true
        }
        visited[i][j] = false
        return false
    }
}