class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        var low = 1
        var high = n
        while low <= high {
            let mid = low + (high - low) / 2
            let temp = mid * (mid + 1) / 2
            if temp < n {
                low = mid + 1
            } else if temp > n {
                high = mid - 1
            } else {
                return mid
            }
        }
        return low - 1
    }
}