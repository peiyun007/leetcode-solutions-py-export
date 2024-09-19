class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        var low = 1
        var high = num
        while low <= high {
            let mid = low + (high - low) / 2
            if mid * mid < num {
                low = mid + 1
            } else if mid * mid > num {
                high = mid - 1
            } else {
                return true
            }
        }
        return false
    }
}