class Solution {
    func numsSameConsecDiff(_ n: Int, _ k: Int) -> [Int] {
        var res = [Int]()
        for i in 1...9 {
            dfs(String(i), i)
        }
        return res

        func dfs(_ temp: String, _ cur: Int) {
            if temp.count == n {
                res.append(Int(temp) ?? 0)
                return
            }
            if cur+k < 10 {
                dfs(temp+String(cur+k), cur+k)
            }
            if cur-k >= 0 && k > 0 {
                dfs(temp+String(cur-k), cur-k)
            }
        }
    }
}