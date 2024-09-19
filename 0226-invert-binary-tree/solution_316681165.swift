/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        dfs(root)
        return root
    }
    func dfs(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        var leftChild = root.left
        root.left = root.right
        root.right = leftChild
        dfs(root.left)
        dfs(root.right)
    }
}