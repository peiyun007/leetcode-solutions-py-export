/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        var queue = [(TreeNode, Int)]()
        var res: Int = 1
        queue.append((root, 1))
        while !queue.isEmpty {
            var size = queue.count
            let delta = queue[0].1
            res = max(res, queue[size-1].1 - queue[0].1 + 1)
            while size > 0 {
                let cur = queue.removeFirst()
                if let left = cur.0.left {
                    queue.append((left, (cur.1 - delta) * 2))
                }
                if let right = cur.0.right {
                    queue.append((right, (cur.1 - delta) * 2 + 1))
                }
                size -= 1
            }
        }
        return Int(res)
    }
}