class Solution {
    func maxValue(_ n: Int, _ index: Int, _ maxSum: Int) -> Int {
        var left = 1, right = maxSum + 1
        while left < right {
            let mid = left + (right-left) / 2
            if check(mid) {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left - 1

        func check(_ mid: Int) -> Bool {
            let sum = mid + cal(mid-1, index) + cal(mid-1, n - index - 1)
            return sum <= maxSum
        }

        func cal(_ big: Int, _ len: Int) -> Int {
            if big >= len {
                return len*(big+big-len+1) / 2
            } else {
                let ones = len-big
                return big*(big+1)/2 + ones
            }
        }
    }
}