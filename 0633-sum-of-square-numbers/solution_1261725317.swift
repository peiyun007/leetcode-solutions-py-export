class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        var left = 0, right = Int(Double(c).squareRoot())
        while left <= right {
            let sum = left * left + right * right
            if sum == c {
                return true
            } else if sum < c {
                left += 1
            } else {
                right -= 1
            }
        }
        return false
    }
}