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
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root else { return nil }
        if p === root || q === root {
            return root
        }
        let lca_l = lowestCommonAncestor(root.left, p, q)
        let lca_r = lowestCommonAncestor(root.right, p, q)
        if lca_l != nil, lca_r != nil {
            return root
        } else if lca_l != nil {
            return lca_l
        } else {
            return lca_r
        }
    }
}