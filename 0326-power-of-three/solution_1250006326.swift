class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        if n < 0 {
            return false
        }
        var x = n
        while x != 0 {
            if x == 1 {
                return true
            }
            if x % 3 != 0 {
                break
            }
            x = x / 3
        }
        return false
    }
}