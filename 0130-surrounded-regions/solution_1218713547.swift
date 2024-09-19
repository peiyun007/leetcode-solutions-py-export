class Solution {
    var m = 0
    var n = 0
    func solve(_ board: inout [[Character]]) {
        m = board.count
        n = board[0].count
        for i in 0..<m {
            dfs(&board, i, 0)
            dfs(&board, i, n-1)
        }
        for j in 0..<n {
            dfs(&board, 0, j)
            dfs(&board, m-1, j)
        }
        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == "O" {
                    board[i][j] = "X"
                } else if board[i][j] == "G" {
                    board[i][j] = "O"
                }
            } 
        }
    }

    func dfs(_ board: inout [[Character]], _ x: Int, _ y: Int) {
        if x < 0 || x >= m || y < 0 || y >= n || board[x][y] != "O" {
            return
        }
        board[x][y] = "G"
        dfs(&board, x-1, y)
        dfs(&board, x+1, y)
        dfs(&board, x, y-1)
        dfs(&board, x, y+1)
    }
}