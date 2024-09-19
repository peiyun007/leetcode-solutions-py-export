class Solution {
    func pyramidTransition(_ bottom: String, _ allowed: [String]) -> Bool {
        let bArr = Array(bottom)
        let depth = bArr.count - 1
        var pyramid = Array(repeating: Array(repeating: 0, count: depth + 1), count: depth + 1)
        var candidate = Array(repeating: Array(repeating: Array(repeating: false, count: 7), count: 7), count: 7)
        for i in 0..<bArr.count {
            pyramid[depth][i] = getInt(bArr[i])
        }
        for s in allowed {
            let arr = Array(s)
            candidate[getInt(arr[0])][getInt(arr[1])][getInt(arr[2])] = true
        }
        return dfs(depth, 0)

        func dfs(_ row: Int, _ index: Int) -> Bool {
            if row == 0 && index == 0 {
                return true
            }
            if index == row {
                return dfs(row-1, 0)
            }
            let first = pyramid[row][index]
            let second = pyramid[row][index+1]
            for i in 0..<7 {
                if candidate[first][second][i] {
                    pyramid[row-1][index] = i
                    if dfs(row, index+1) {
                        return true
                    }
                }
            }
            return false
        }
    }

    func getInt(_ c: Character) -> Int {
        return Int(c.asciiValue ?? 0) - Int(Character("A").asciiValue ?? 0)
    }
}