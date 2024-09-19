class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var left = 1
        var right = piles.max() ?? 0 + 1
        var res = 0
        while left < right {
            let mid = left + (right - left) / 2
            if helper(mid) <= h {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left

        func helper(_ speed: Int) -> Int {
            return piles.reduce(0) { $0 + ($1 + speed - 1) / speed }
        }
    }
}