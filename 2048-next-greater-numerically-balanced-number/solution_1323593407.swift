class Solution {
    func nextBeautifulNumber(_ n: Int) -> Int {
        var vis = Array(repeating: 0, count: 7)
        var tab = [Int]()
        dfs(0)
        tab.sort()
        var l = 0, r = tab.count
        while l < r {
            let mid = l + (r-l) / 2
            if tab[mid] <= n {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return tab[l]


        func check() -> Int {
            var flag = true
            for i in 1..<7 {
                if vis[i] > 0 && vis[i] != i {
                    flag = false
                }
                if vis[i] > i {
                    return 2
                }
            }
            return flag ? 1 : 0
        }

        func dfs(_ x: Int) {
            if x > 1224444 { return }
            let ck = check()
            if ck == 2 { return }
            if ck == 1 { 
                tab.append(x)
            }
            for i in 1..<7 {
                vis[i] += 1
                let nx = x*10 + i
                dfs(nx)
                vis[i] -= 1
            }
        }
    }
}