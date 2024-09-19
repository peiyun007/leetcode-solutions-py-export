/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var next: Node?
 *     public var random: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *    	   self.random = nil
 *     }
 * }
 */

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        guard let head else { return nil }
        var dict = [Node: Node]()
        var cur: Node? = head
        while let curUnwrapped = cur {
            dict[curUnwrapped] = Node(curUnwrapped.val)
            cur = cur?.next
        }
        cur = head
        while let curUnwrapped = cur {
            if let nxt = curUnwrapped.next {
                dict[curUnwrapped]?.next = dict[nxt]
            }
            if let rdom = curUnwrapped.random {
                dict[curUnwrapped]?.random = dict[rdom]
            }
            cur = cur?.next
        }
        return dict[head]
    }
}