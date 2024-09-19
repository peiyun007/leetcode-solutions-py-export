/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var prev: Node?
 *     public var next: Node?
 *     public var child: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.prev = nil
 *         self.next = nil
 *         self.child  = nil
 *     }
 * }
 */

class Solution {
    func flatten(_ head: Node?) -> Node? {
        dfs(head)
        return head
    }

    func dfs(_ node: Node?) -> Node? {
        var cur = node
        var last: Node? = nil
        while cur != nil {
            guard let curUnWrapped = cur else { break }
            var next = curUnWrapped.next
            if curUnWrapped.child != nil {
                let childLast = dfs(curUnWrapped.child)
                
                curUnWrapped.next = curUnWrapped.child
                curUnWrapped.child?.prev = curUnWrapped

                if next != nil {
                    childLast?.next = next
                    next?.prev = childLast
                }
                curUnWrapped.child = nil
                last = childLast
            } else {
                last = curUnWrapped
            }
            cur = next
        }
        return last
    }
}