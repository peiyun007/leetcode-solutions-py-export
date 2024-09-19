/*
class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var j = 0
        for i in m..<m+n {
            nums1[i] = nums2[j]
            j += 1
        }
        nums1.sort{$0<$1}
    }
}
*/


class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var p1 = m-1
        var p2 = n-1
        var tail = m + n - 1
        while p1 >= 0 || p2 >= 0 {
            var cur: Int
            if p1 == -1 {
                cur = nums2[p2]
                p2 -= 1
            } else if p2 == -1 {
                cur = nums1[p1]
                p1 -= 1
            } else if nums1[p1] >= nums2[p2] {
                cur = nums1[p1]
                p1 -= 1
            } else {
                cur = nums2[p2]
                p2 -= 1
            }
            nums1[tail] = cur
            tail -= 1
        }
    }
}
