/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func nextLargerNodes(_ head: ListNode?) -> [Int] {
        var p = head
        var stack = [Int]()
        var idx = -1
        var res = [Int]()
        var nums = [Int]()
        while let p2 = p {
            idx += 1
            nums.append(p2.val)
            res.append(0)
            while !stack.isEmpty && p2.val > nums[stack[stack.count-1]] {
                let prev = stack.removeLast()
                res[prev] = p2.val
            }
            stack.append(idx)
            p = p2.next
        }
        return res
    }
}