class Solution {
    func minAbsoluteSumDiff(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let mod = 1_0000_0000_7
        let arr1 = nums1.sorted(by: <)
        let n = arr1.count
        var sum = 0, maxn = 0
        for i in 0..<n {
            let diff = abs(nums1[i]-nums2[i])
            sum = (sum + diff) % mod
            let j = lowerBound(nums2[i])
            if j < n {
                maxn = max(maxn, diff - (arr1[j] - nums2[i]))
            }
            if j > 0 {
                maxn = max(maxn, diff - (nums2[i] - arr1[j-1]))
            }
        }
        return (sum - maxn + mod) % mod

        func lowerBound(_ target: Int) -> Int {
            var l = 0, r = arr1.count
            while l < r {
                let mid = l + (r-l) / 2
                if arr1[mid] >= target {
                    r = mid
                } else {
                    l = mid + 1
                }
            }
            return l
        }
    }
}