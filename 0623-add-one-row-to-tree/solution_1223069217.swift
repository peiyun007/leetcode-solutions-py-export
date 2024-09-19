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
    func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
        if root == nil {
            return nil
        }
        if depth == 1 {
            return TreeNode(val, root, nil)
        }
        if depth == 2 {
            root?.left = TreeNode(val, root?.left, nil)
            root?.right = TreeNode(val, nil, root?.right)
        } else {
            root?.left = addOneRow(root?.left, val, depth - 1)
            root?.right = addOneRow(root?.right, val, depth - 1)
        }
        return root
    }
}