class Solution {
    var set = Set<Int>()
    func isHappy(_ n: Int) -> Bool {
        if set.contains(n) {
            return false
        }
        if n == 1 {
            return true
        }
        set.insert(n)
        var nxt = 0
        var vn = n
        while vn > 0 {
            nxt += (vn % 10) * (vn % 10)
            vn = vn / 10
        }
        return isHappy(nxt)
    }
}