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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var n = 0
        var cur = head
        while cur != nil {
            n += 1
            cur = cur?.next
        }

        var dummy: ListNode? = ListNode(0, head)
        var p0 = dummy
        
        while n >= k {
            n -= k

            cur = p0?.next
            var pre: ListNode? = nil
            for i in 0..<k {
                let nxt = cur?.next
                cur?.next = pre
                pre = cur
                cur = nxt
            }
            let nxt = p0?.next
            p0?.next?.next = cur
            p0?.next = pre
            p0 = nxt
        }
        
        return dummy?.next
    }
}