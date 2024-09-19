class Solution {
    func minStickers(_ stickers: [String], _ target: String) -> Int {
        let kInf = Int.max / 2
        var memo = [Int: Int]()
        let n = target.count
        let tArr = Array(target)
        let res = dfs(0)
        return res == kInf ? -1 : res

        func dfs(_ state: Int) -> Int {
            if state == 1 << n - 1 {
                return 0
            }
            if let val = memo[state] {
                return val
            }
            var ans = kInf
            for st in stickers {
                var nstate = state
            outLoop: for ch in st {
                    for i in 0..<n {
                        if tArr[i] == ch && ((nstate >> i) & 1 == 0) {
                            nstate |= (1 << i)
                            continue outLoop
                        }
                    }
                }
                if nstate != state {
                    ans = min(ans, dfs(nstate)+1)
                }
            }
            memo[state] = ans
            return ans
        }
    }
}