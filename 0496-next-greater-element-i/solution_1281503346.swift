class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var map = [Int: Int]()
        var stack = [Int]()
        for (i, x) in nums2.enumerated() {
            while !stack.isEmpty && x > stack[stack.count-1] {
                let num = stack.removeLast()
                map[num] = x
            }
            stack.append(x)
        }
        var res = [Int]()
        for x in nums1 {
            if let num = map[x] {
                res.append(num)
            } else {
                res.append(-1)
            }
        }
        return res
    }
}