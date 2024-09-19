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
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var loop = false
        var fast = head, slow = head
        while true {
            if fast == nil || fast?.next == nil {
                loop = false
                break
            }
            fast = fast?.next?.next
            slow = slow?.next
            if fast === slow {
                loop = true
                break
            }
        }
        if !loop {
            return nil
        }
        var length = 1
        fast = fast?.next
        while fast !== slow {
            fast = fast?.next
            length += 1
        }
        fast = head
        slow = head
        while length > 0 {
            fast = fast?.next
            length -= 1
        }
        while fast !== slow {
            fast = fast?.next
            slow = slow?.next
        }
        return slow
    }
}