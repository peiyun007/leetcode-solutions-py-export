/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root else {
            return nil
        }
        var queue = [Node]()
        queue.append(root)
        while !queue.isEmpty {
            var size = queue.count
            var rightNode: Node? = nil
            while size > 0 {
                let cur = queue.removeFirst()
                cur.next = rightNode
                rightNode = cur
                if let right = cur.right {
                    queue.append(right)
                }
                if let left = cur.left {
                    queue.append(left)
                }
                size -= 1
            }
        }
        return root
    }
}