class Solution {
    func mySqrt(_ x: Int) -> Int {
        if x <= 1 {
            return x
        }
        var low = 1
        var high = x
        while low < high {
            let mid = low + (high - low) / 2
            if mid * mid > x {
                high = mid - 1
            } else {
                if (mid + 1) * (mid + 1) > x {
                    return mid
                }
                low = mid + 1
            }
        }
        return low
    }
}