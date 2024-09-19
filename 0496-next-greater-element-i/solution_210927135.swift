class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var map = [Int: Int]()
        var stack = [Int]()
        var res = nums1
        for num in nums2 {
            while !stack.isEmpty && num > stack[stack.count - 1] {
                let x = stack.removeLast()
                map[x] = num
            }
            stack.append(num)
        }
        for (i, num) in nums1.enumerated() {
            res[i] = map[num] ?? -1
        }
        return res
    }
}