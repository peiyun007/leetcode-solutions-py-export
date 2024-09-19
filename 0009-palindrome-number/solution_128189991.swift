class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x != 0 && x % 10 == 0) {
            return false
        }
        var remaining = x
        var revertedNumber = 0
        while remaining > revertedNumber {
            revertedNumber = revertedNumber * 10 + remaining % 10
            remaining = remaining / 10
        }
        return remaining == revertedNumber || remaining == revertedNumber / 10
    }
}