class Solution {
    func maxProduct(_ s: String) -> Int {
        var res = 0
        let sArr = Array(s)
        dfs([], [], 0)
        return res

        func dfs(_ s1: [Character], _ s2: [Character], _ index: Int) {
            if check(s1) && check(s2) {
                res = max(res, s1.count * s2.count)
            }
            if index == sArr.count {
                return
            }
            dfs(s1+[sArr[index]], s2, index+1)
            dfs(s1, s2+[sArr[index]], index+1)
            dfs(s1, s2, index+1)
        }

        func check(_ chs: [Character]) -> Bool {
            var l = 0, r = chs.count-1
            while l < r {
                if chs[l] != chs[r] {
                    return false
                }
                l += 1
                r -= 1
            }
            return true
        }
    }
}