class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = Array(repeating: Array(repeating: 0, count: 10), count: 9)
        var cols = Array(repeating: Array(repeating: 0, count: 10), count: 9)
        var subboxes = Array(repeating: Array(repeating: Array(repeating: 0, count: 10), count: 3), count: 3)
        for i in 0..<9 {
            for j in 0..<9 {
                let ch = board[i][j]
                if ch == "." { continue }
                let x = Int(String(ch)) ?? 1
                rows[i][x] += 1
                cols[j][x] += 1
                subboxes[i/3][j/3][x] += 1
                if rows[i][x] > 1 || cols[j][x] > 1 || subboxes[i/3][j/3][x] > 1 {
                    return false
                }
            }
        }
        return true
    }
}