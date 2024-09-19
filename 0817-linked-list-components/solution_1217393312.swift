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
    func numComponents(_ head: ListNode?, _ nums: [Int]) -> Int {
        var f = Set<Int>(nums)
        var p = head
        var ans = 0
        while p != nil {
            if let val = p?.val, f.contains(val), p?.next == nil || !(f.contains(p?.next?.val ?? Int.max)) {
                ans += 1
            }
            p = p?.next
        }
        return ans
    }
}