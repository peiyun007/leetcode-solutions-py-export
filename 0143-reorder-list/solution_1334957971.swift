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
    func reorderList(_ head: ListNode?) {
        if head == nil { return }
        var arr = [ListNode]()
        var p = head
        while let p2 = p {
            arr.append(p2)
            p = p?.next
        }
        var i = 0, j = arr.count - 1
        while i < j {
            arr[i].next = arr[j]
            i += 1
            arr[j].next = arr[i]
            j -= 1
        }
        arr[i].next = nil
    }
}