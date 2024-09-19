class Solution {
    func addOperators(_ num: String, _ target: Int) -> [String] {
        var res = [String]()
        let sArr = Array(num)
        let n = sArr.count
        dfs(0, 0, 0, "")
        return res

        func dfs(_ idx: Int, _ pre: Int, _ cur: Int, _ temp: String) {
            if idx == n {
                if cur == target {
                    res.append(temp)
                }
                return
            }
            for i in idx..<n {
                if i != idx && sArr[idx] == "0" { break }
                let next = Int(String(Array(sArr[idx...i]))) ?? 0
                if idx == 0 {
                    dfs(i+1, next, next, temp+String(next))
                } else {
                    dfs(i+1, next, cur+next, temp+"+"+String(next))
                    dfs(i+1, -next, cur-next, temp+"-"+String(next))
                    dfs(i+1, pre*next, (cur-pre)+pre*next, temp+"*"+String(next))
                }
            }
        }
    }
}