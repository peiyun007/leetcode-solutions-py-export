class Solution {
    func minimumSize(_ nums: [Int], _ maxOperations: Int) -> Int {
        let n = nums.count
        let maxVal = nums.max() ?? 0
        var l = 1, r = maxVal + 1
        while l < r {
            let mid = l + (r-l) / 2
            if check(mid) {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return l

        func check(_ y: Int) -> Bool {
            var cnt = 0
            for x in nums {
                cnt += (x-1)/y
            }
            return cnt <= maxOperations
        }
    }
}