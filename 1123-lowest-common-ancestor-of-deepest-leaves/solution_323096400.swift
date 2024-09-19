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
    func lcaDeepestLeaves(_ root: TreeNode?) -> TreeNode? {
        return dfs(root)
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        return max(maxDepth(root.left), maxDepth(root.right)) + 1
    }
    
    func dfs(_ root: TreeNode?) -> TreeNode? {
        let leftDepth = maxDepth(root?.left)
        let rightDepth = maxDepth(root?.right)
        if leftDepth == rightDepth {
            return root
        }
        if leftDepth > rightDepth {
            return dfs(root?.left)
        } else {
            return dfs(root?.right)
        }
    }
}