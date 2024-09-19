class Solution {
    func smallestDivisor(_ nums: [Int], _ threshold: Int) -> Int {
        var l = 1, r = (nums.max() ?? 0) + 1
        while l < r {
            let mid = l + (r-l) / 2
            let sum = nums.reduce(0) { return $0 + Int(ceil(Double($1) / Double(mid))) }
            if sum <= threshold {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return l
    }
}