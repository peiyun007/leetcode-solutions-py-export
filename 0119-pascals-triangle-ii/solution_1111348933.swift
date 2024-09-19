class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        guard rowIndex >= 0 else {
            return []
        }
        var preRow = [1]
        if rowIndex < 1 {
            return preRow
        }
        for i in 1...rowIndex {
            var newRow: [Int] = []
            newRow.append(1)
            if preRow.count > 1 {
                for j in 1..<preRow.count {
                    newRow.append(preRow[j-1] + preRow[j])
                }
            }
            newRow.append(1)
            preRow = newRow
        }
        return preRow
    }
}