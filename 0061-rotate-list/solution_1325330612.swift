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
    func rotateRight(_ head: ListNode?, _ k0: Int) -> ListNode? {
        var dummy = ListNode(0, head)
        var size = 0
        var p = head
        while p != nil {
            p = p?.next
            size += 1
        }
        if size == 0 {
            return nil
        }
        var k = k0 % size
        k = size - k - 1
        p = head
        for i in 0..<k {
            p = p?.next
        }
        if p != nil && p?.next == nil {
            return head
        }
        var tmp = p?.next
        p?.next = nil
        var tmpp = tmp
        while tmpp?.next != nil {
            tmpp = tmpp?.next
        }
        tmpp?.next = head
        dummy.next = tmp

        return dummy.next
    }
}