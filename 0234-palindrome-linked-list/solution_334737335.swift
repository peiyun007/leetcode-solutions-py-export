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
    func isPalindrome(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        fast = head
        slow = reverse(slow)
        while slow != nil {
            if fast?.val != slow?.val {
                return false
            }
            fast = fast?.next
            slow = slow?.next
        }
        return true
    }
    
    private func reverse(_ slow: ListNode?) -> ListNode? {
        var head = slow
        var preNode: ListNode? = nil
        while head != nil {
            let nextNode = head?.next
            head?.next = preNode
            preNode = head
            head = nextNode
        }
        return preNode
    }
}