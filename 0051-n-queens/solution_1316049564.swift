class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var cols = Array(repeating: -1, count: n)
        var onPath = Set<Int>()
        var line1 = Set<Int>()
        var line2 = Set<Int>()
        var res = [[String]]()
        dfs(0)
        return res

        func dfs(_ row: Int) {
            if row == n {
                var temp = [String]()
                for i in 0..<cols.count {
                    var arr: [Character] = Array(repeating: ".", count: n)
                    arr[cols[i]] = "Q"
                    temp.append(String(arr))
                }
                res.append(temp)
                return
            }
            for i in 0..<n {
                if cols[row] != -1 { continue }
                if onPath.contains(i) { continue }
                if line1.contains(row-i) { continue }
                if line2.contains(row+i) { continue }
                cols[row] = i
                onPath.insert(i)
                line1.insert(row-i)
                line2.insert(row+i)
                dfs(row+1)
                cols[row] = -1
                onPath.remove(i)
                line1.remove(row-i)
                line2.remove(row+i)
            }
        }
    }
}