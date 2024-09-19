class Solution {
    // 参考：花花酱
    func countVowelPermutation(_ n: Int) -> Int {
        let mod = 1_0000_0000_7
        var a = 1, e = 1, i = 1, o = 1, u = 1
        if n == 1 {
            return 5
        }
        var ans = 0
        for j in 2...n {
            var aa = (e + i + u) % mod
            var ee = (a + i) % mod
            var ii = (e + o) % mod
            var oo = (i) % mod
            var uu = (i + o) % mod
            a = aa
            e = ee
            i = ii
            o = oo
            u = uu
        }
        return (a + e + i + o + u) % mod
    }
}