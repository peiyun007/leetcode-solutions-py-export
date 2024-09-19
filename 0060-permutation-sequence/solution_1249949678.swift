class Solution {
    func getPermutation(_ n: Int, _ kExternal: Int) -> String {
        var f = Array(repeating: 0, count: n+1)
        var k = kExternal
        var resArr = [Int]()
        var used = Array(repeating: false, count: n+1)
        calF()
        dfs(0)
        return resArr.reduce("") { $0 + String($1) }

        func dfs(_ index: Int) {
            if index == n {
                return
            }
            let cnt = f[n-1-index]
            for i in 1...n {
                if used[i] {
                    continue
                }
                if cnt < k {
                    k -= cnt
                    continue
                }
                used[i] = true
                resArr.append(i)
                dfs(index+1)
                return
            }
        }
        
        func calF() {
            f[0] = 1
            for i in 1...n {
                f[i] = f[i-1] * i
            }
        }
    }
}