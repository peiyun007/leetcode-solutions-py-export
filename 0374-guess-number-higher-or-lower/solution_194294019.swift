class Solution {
    func guessNumber(_ n: Int, _ pick: Int) -> Int {
        var low = 1
        var high = n
        while low <= high {
            let mid = low + (high - low) / 2
            let res = guess(mid, pick)
            if res == 0 {
                return mid
            } else if res < 0 {
                high = mid - 1
            } else if res > 0 {
                low = mid + 1
            }
        }
        return -1
    }
    func guess(_ n: Int, _ pick: Int) -> Int {
        if n > pick {
            return -1
        } else if n < pick {
            return 1
        } else {
            return 0
        }
    }
}