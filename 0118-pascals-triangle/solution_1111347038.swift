class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 0 else {
            return [[]]
        }
        var res = [[Int]]()
        res.append([1])
        if numRows < 2 {
            return res
        }
        var preRow = [1]
        for i in 2...numRows {
            var newRow: [Int] = []
            newRow.append(1)
            if preRow.count > 1 {
                for j in 1..<preRow.count {
                    newRow.append(preRow[j-1] + preRow[j])
                }
            }
            newRow.append(1)
            preRow = newRow
            res.append(newRow)
        }
        return res
    }
}