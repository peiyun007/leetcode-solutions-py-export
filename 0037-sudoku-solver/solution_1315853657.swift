class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        let m = board.count, n = board[0].count
        var rowUsed = Array(repeating: Array(repeating: false, count: 10), count: 9)
        var colUsed = Array(repeating: Array(repeating: false, count: 10), count: 9)
        var boxUsed = Array(repeating: Array(repeating: Array(repeating: false, count: 10), count: 3), count: 3)
        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] != "." {
                    let num = Int(String(board[i][j])) ?? 0
                    rowUsed[i][num] = true
                    colUsed[j][num] = true
                    boxUsed[i/3][j/3][num] = true
                }
            }
        }
        dfs(0, 0)

        func dfs(_ row0: Int, _ col0: Int) -> Bool {
            var row = row0
            var col = col0
            if col == n {
                col = 0
                row += 1
                if row == m {
                    return true
                }
            }
            if board[row][col] == "." {
                for num in 1...9 {
                    let canUsed = !(rowUsed[row][num] || colUsed[col][num] || boxUsed[row/3][col/3][num])
                    if !canUsed { continue }
                    rowUsed[row][num] = true
                    colUsed[col][num] = true
                    boxUsed[row/3][col/3][num] = true
                    board[row][col] = Character(String(num))

                    if dfs(row, col+1) {
                        return true
                    }

                    rowUsed[row][num] = false
                    colUsed[col][num] = false
                    boxUsed[row/3][col/3][num] = false
                    board[row][col] = "."
                }
            } else {
                return dfs(row, col+1)
            }
            return false
        }
    }
}