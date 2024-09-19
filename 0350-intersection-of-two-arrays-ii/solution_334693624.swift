class Solution {
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
}