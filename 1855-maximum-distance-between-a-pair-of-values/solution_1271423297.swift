class Solution {
    func maxDistance(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let m = nums1.count
        let n = nums2.count
        var maxn = 0
        for i in 0..<n {
            let x = nums2[i]
            let j = lowerBound(nums1, 0, min(i+1, m), x)
            if j < m {
                maxn = max(maxn, i-j)
            }
        }
        return maxn

        func lowerBound(_ arr: [Int], _ left: Int, _ right: Int, _ x: Int) -> Int {
            var l = left
            var r = right
            while l < r {
                let mid = l + (r-l) / 2
                if arr[mid] <= x {
                    r = mid
                } else {
                    l = mid + 1
                }
            }
            return l
        }
    }
}