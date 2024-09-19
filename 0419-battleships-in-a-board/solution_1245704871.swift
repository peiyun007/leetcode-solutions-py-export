class Solution {
    func countBattleships(_ board: [[Character]]) -> Int {
        var matrix = board
        let m = matrix.count
        let n = matrix[0].count
        var res = 0
        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] == "X" {
                    matrix[i][j] = "."
                    res += 1
                    for k in j+1..<n {
                        if matrix[i][k] == "X" {
                            matrix[i][k] = "."
                        } else {
                            break
                        }
                    }
                    for k in i+1..<m {
                        if matrix[k][j] == "X" {
                            matrix[k][j] = "."
                        } else {
                            break
                        }
                    }
                }
            }
        }
        return res
    }
}