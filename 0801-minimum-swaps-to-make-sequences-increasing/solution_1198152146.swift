class Solution {
    /// 参考：花花酱 LeetCode 801
    func minSwap(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let n = nums1.count
        var keep = Array(repeating: Int.max / 2, count: n)
        var swap = Array(repeating: Int.max / 2, count: n)
        keep[0] = 0
        swap[0] = 1
        for i in 1..<n {
            if nums1[i] > nums1[i-1] && nums2[i] > nums2[i-1] {
                keep[i] = keep[i-1]
                swap[i] = swap[i-1] + 1
            }
            if nums1[i] > nums2[i-1] && nums2[i] > nums1[i-1] {
                swap[i] = min(swap[i], keep[i-1] + 1)
                keep[i] = min(keep[i], swap[i-1])
            }
        }
        return min(keep[n-1], swap[n-1])
    }
}