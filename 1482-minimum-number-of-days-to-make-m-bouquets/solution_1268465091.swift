class Solution {
    func minDays(_ bloomDay: [Int], _ m: Int, _ k: Int) -> Int {
        if m > bloomDay.count / k {
            return -1
        }
        var low = bloomDay.min() ?? 0
        var high = bloomDay.max() ?? 0
        let n = bloomDay.count
        while low < high {
            let mid = low + (high - low) / 2
            if canMake(mid) {
                high = mid
            } else {
                low = mid + 1
            }
        }
        return low

        func canMake(_ days: Int) -> Bool {
            var cnt = 0
            var flowers = 0
            for i in 0..<n where cnt < m {
                if bloomDay[i] <= days {
                    flowers += 1
                    if flowers == k {
                        cnt += 1
                        flowers = 0
                    }
                } else {
                    flowers = 0
                }
            }
            return cnt >= m
        }
    }
}