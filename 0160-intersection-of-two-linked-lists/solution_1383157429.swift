/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var pa = headA
        var pb = headB
        while pa !== pb {
            if pa == nil {
                pa = headB
            } else {
                pa = pa?.next
            }
            if pb == nil {
                pb = headA
            } else {
                pb = pb?.next
            }
        }
        return pa
    }
}