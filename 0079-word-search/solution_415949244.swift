private extension String {
    subscript(index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard board.count > 0 && board[0].count > 0 else {
            return false
        }
        let m = board.count, n = board[0].count
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == word[0] && dfs(board, word, m, n, i, j, &visited, 0) {
                    return true
                }
            }
        }
        return false
    }
    
    private func dfs(_ board: [[Character]], _ word: String, _ m: Int, _ n: Int, _ i: Int, _ j: Int, _ visited: inout [[Bool]], _ index: Int) -> Bool {
        if index == word.count {
            return true
        }
        guard i >= 0 && i < m && j >= 0 && j < n else {
            return false
        }
        guard !visited[i][j] && board[i][j] == word[index] else {
            return false
        }
        visited[i][j] = true
        let match = dfs(board, word, m, n, i, j-1, &visited, index+1) 
        || dfs(board, word, m, n, i, j+1, &visited, index+1)  
        || dfs(board, word, m, n, i-1, j, &visited, index+1)
        || dfs(board, word, m, n, i+1, j, &visited, index+1)
        if match {
            return true
        }
        visited[i][j] = false
        return false
    }
}