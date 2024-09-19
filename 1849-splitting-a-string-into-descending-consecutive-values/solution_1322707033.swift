class Solution {
    func splitString(_ s: String) -> Bool {
        let sArr = Array(s)
        let kInf = 1e10
        let n = sArr.count
        var i = 0
        while i < n {
            if sArr[i] != "0" {
                break
            }
            i += 1
        }
        if i == n { return false }
        var pre = 0
        for j in i..<n-1 where Double(pre) < kInf {
            pre = pre*10 + getInt(sArr[j])
            if dfs(j+1, pre) {
                return true
            }
        }
        return false

        func getInt(_ ch: Character) -> Int {
            return Int(String(ch)) ?? 0
        }

        func dfs(_ index: Int, _ pre: Int) -> Bool {
            if index == n {
                return true
            }
            var cur = 0
            for i in index..<n where Double(cur) < kInf {
                cur = cur*10 + getInt(sArr[i])
                if pre - cur == 1 {
                    if dfs(i+1, cur) {
                        return true
                    }
                } else if cur >= pre {
                    return false
                }
            }
            return false
        }
    }
}