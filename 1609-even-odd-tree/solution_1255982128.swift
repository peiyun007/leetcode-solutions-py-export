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
    func isEvenOddTree(_ root: TreeNode?) -> Bool {
        guard let root else { return false }
        var queue = [TreeNode]()
        var level = 0
        queue.append(root)

        while !queue.isEmpty {
            var size = queue.count
            var prev = level % 2 == 0 ? Int.min : Int.max
            while size > 0 {
                size -= 1

                let cur = queue.removeFirst()
                
                if level % 2 == cur.val % 2 {
                    return false
                }
                if (level % 2 == 0 && prev >= cur.val) || (level % 2 == 1 && prev <= cur.val) {
                    return false
                }
                if let left = cur.left {
                    queue.append(left)
                }
                if let right = cur.right {
                    queue.append(right)
                }
                prev = cur.val
            }
            level += 1
        }
        return true
    }
}