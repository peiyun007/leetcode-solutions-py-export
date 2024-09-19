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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0, head)
        var cur: ListNode? = dummy
        while cur?.next != nil && cur?.next?.next != nil {
            if cur?.next?.val == cur?.next?.next?.val {
                let val = cur?.next?.val
                while cur?.next != nil && cur?.next?.val == val {
                    cur?.next = cur?.next?.next
                }
            } else {
                cur = cur?.next
            }
        }
        return dummy.next
    }
}