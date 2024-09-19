class Solution {
    func countBattleships(_ board: [[Character]]) -> Int {
        var board = board
        let m = board.count
        let n = board[0].count
        var res = 0
        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == "X" {
                    if i-1 >= 0 && board[i-1][j] == "X" {
                        continue
                    }
                    if j-1 >= 0 && board[i][j-1] == "X" {
                        continue
                    }
                    res += 1
                }
            }
        }
        return res
    }
}