class Solution {
    func getHappyString(_ n: Int, _ k: Int) -> String {
        let chs: [Character] = ["a", "b", "c"]
        if k > 3*(1 << (n-1)) {
            return ""
        }
        var ans = [Character]()
        var cnt = 0
        var temp = [Character]()
        dfs(0, &temp)
        return String(ans)

        func dfs(_ i: Int, _ temp: inout [Character]) {
            if cnt > k {
                return
            }
            if i == n {
                cnt += 1
                if cnt == k {
                    ans = temp
                }
                return
            }
            for c in chs {
                if temp.isEmpty || c != temp[temp.count-1] {
                    temp.append(c)
                    dfs(i+1, &temp)
                    temp.removeLast()
                }
            }
        }
    }
}