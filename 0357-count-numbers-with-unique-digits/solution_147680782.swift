class Solution {
    func countNumbersWithUniqueDigits(_ n: Int) -> Int {
        if n >= 11 {
            return 0
        }
        if n == 0 {
            return 1
        }
        var remain = 9
        var result = 10
        var curr = 9
        var an = n
        an -= 1
        while an > 0 && remain > 0 {
            curr *= remain
            result += curr
            an -= 1
            remain -= 1
        }
        return result
    }
}