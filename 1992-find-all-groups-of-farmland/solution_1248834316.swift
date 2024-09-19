class Solution {
    func findFarmland(_ land: [[Int]]) -> [[Int]] {
        let m = land.count
        let n = land[0].count
        var res = [[Int]]()
        for i in 0..<m {
            for j in 0..<n {
                if land[i][j] == 0 || (i-1 >= 0 && land[i-1][j] == 1) || (j-1 >= 0 && land[i][j-1] == 1) {
                    continue
                }
                var endRow = i + 1
                while endRow < m && land[endRow][j] == 1 {
                    endRow += 1
                }
                endRow -= 1
                var endCol = j + 1
                while endCol < n && land[i][endCol] == 1 {
                    endCol += 1
                }
                endCol -= 1
                var arr = [Int]()
                arr.append(i)
                arr.append(j)
                arr.append(endRow)
                arr.append(endCol)
                res.append(arr)
            }
        }
        return res
    }
}