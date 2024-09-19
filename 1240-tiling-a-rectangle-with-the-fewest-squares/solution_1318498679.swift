class Solution {
    func tilingRectangle(_ n: Int, _ m: Int) -> Int {
        var filled = Array(repeating: Array(repeating: false, count: m), count: n)
        var minSquares = n*m
        var ans = n*m
        dfs(0, 0, n*m, 0)
        return minSquares
        
        func dfs(_ startRow0: Int, _ startCol0: Int, _ remain: Int, _ squares: Int) {
            var startRow = startRow0
            var startCol = startCol0
            if squares > minSquares {
                return
            }
            if remain == 0 {
                minSquares = min(minSquares, squares)
                return
            }
            if startCol >= m {
                startRow += 1
                startCol = 0
            }
            if startRow >= n {
                return
            }
            if filled[startRow][startCol] {
                dfs(startRow, startCol+1, remain, squares)
            } else {
                let maxSide = min(n-startRow, m-startCol)
                for side in (1...maxSide).reversed() {
                    if canFill(startRow, startCol, side) {
                        fill(startRow, startCol, side)
                        dfs(startRow, startCol+side, remain-side*side, squares+1)
                        revert(startRow, startCol, side)
                    }
                }
            }
        }

        func canFill(_ startRow: Int, _ startCol: Int, _ side: Int) -> Bool {
            if startRow + side > n || startCol + side > m {
                return false
            }
            for i in 0..<side {
                for j in 0..<side {
                    if filled[startRow+i][startCol+j] {
                        return false
                    }
                }
            }
            return true
        }

        func fill(_ startRow: Int, _ startCol: Int, _ side: Int) {
            fillWithValue(startRow, startCol, side, true)
        }

        func revert(_ startRow: Int, _ startCol: Int, _ side: Int) {
            fillWithValue(startRow, startCol, side, false)
        }

        func fillWithValue(_ startRow: Int, _ startCol: Int, _ side: Int, _ value: Bool) {
            for i in 0..<side {
                for j in 0..<side {
                    filled[startRow+i][startCol+j] = value
                }
            }
        }
    }
}
