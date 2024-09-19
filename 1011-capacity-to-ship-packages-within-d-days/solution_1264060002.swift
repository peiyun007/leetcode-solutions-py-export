class Solution {
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        var left = weights.max() ?? 0
        let sum = weights.reduce(0) { $0+$1 }
        var right = sum + 1
        while left < right {
            let mid = left + (right - left) / 2
            var need = 1, cur = 0
            for w in weights {
                if cur + w > mid {
                    need += 1
                    cur = 0
                }
                cur += w
            }
            if need <= days {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}