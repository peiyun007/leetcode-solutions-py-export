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
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        var dummy: ListNode? = ListNode(0, head)
        var p0 = dummy
        for i in 1..<left {
            p0 = p0?.next
        }
        var cur = p0?.next
        var pre: ListNode? = nil
        for i in 0..<(right-left+1) {
            let nxt = cur?.next
            cur?.next = pre
            pre = cur
            cur = nxt
        }

        p0?.next?.next = cur
        p0?.next = pre
        return dummy?.next
    }
}