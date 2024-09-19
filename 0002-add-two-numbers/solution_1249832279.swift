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
    func addTwoNumbers(_ l1External: ListNode?, _ l2External: ListNode?, _ carryExternal: Int = 0) -> ListNode? {
        var l1 = l1External, l2 = l2External, carry = carryExternal
        if l1 == nil && l2 == nil {
            return carry != 0 ? ListNode(carry) : nil
        }
        if l1 == nil {
            (l1, l2) = (l2, l1)
        }
        carry = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
        l1?.val = carry % 10
        l1?.next = addTwoNumbers(l1?.next, l2?.next, carry / 10)
        return l1
    }
}