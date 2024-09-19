class Solution {
    /* HashMap solution
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var map = [Int: Int]()
        var res = [Int]()
        for i in nums1 {
            map[i] = (map[i] ?? 0) + 1
        }
        for i in nums2 {
            if let value = map[i], value > 0 {
                res.append(i)
                map[i] = value - 1
            }
        }
        return res
    }
    */
    
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var arr1 = nums1.sorted{$0 < $1}
        var arr2 = nums2.sorted{$0 < $1}
        var i = 0, j = 0
        var res = [Int]()
        while i < arr1.count && j < arr2.count {
            if arr1[i] < arr2[j] {
                i += 1
            } else if arr1[i] > arr2[j] {
                j += 1
            } else {
                res.append(arr1[i])
                i += 1
                j += 1
            }
        }
        return res
    }
}