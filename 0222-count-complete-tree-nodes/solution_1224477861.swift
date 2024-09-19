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
    func countNodes(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        var l_depth = 0
        var r_depth = 0
        var node = root
        while node?.left != nil {
            l_depth += 1
            node = node?.left
        }
        node = root
        while node?.right != nil {
            r_depth += 1
            node = node?.right
        }
        if l_depth == r_depth {
            return 1 << (l_depth + 1) - 1
        } else {
            return countNodes(root?.left) + countNodes(root?.right) + 1
        }
    }
}