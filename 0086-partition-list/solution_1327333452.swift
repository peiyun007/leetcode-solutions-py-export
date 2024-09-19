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
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var dummySmall = ListNode(0)
        var dummyBig = ListNode(0)
        var small: ListNode? = dummySmall, big: ListNode? = dummyBig
        var cur = head
        while cur != nil {
            if (cur?.val ?? 0) < x {
                small?.next = cur
                small = cur
            } else {
                big?.next = cur
                big = cur
            }
            cur = cur?.next
        }
        small?.next = dummyBig.next
        big?.next = nil
        return dummySmall.next
    }
}