class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n < 0 {
            return false
        }
        var x = n
        while x > 0 {
            if x == 1 {
                return true
            }
            if x % 2 != 0 {
                break
            }
            x = x / 2
        }
        return false
    }
}