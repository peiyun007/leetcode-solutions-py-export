class Solution {
    func numSubarrayBoundedMax(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
        return notGreater(right) - notGreater(left-1)
        func notGreater(_ r: Int) -> Int {
            var ans = 0
            var w = 0
            for x in nums {
                if x <= r {
                    w += 1
                } else {
                    w = 0
                }
                ans += w
            }
            return ans
        }
    }
}