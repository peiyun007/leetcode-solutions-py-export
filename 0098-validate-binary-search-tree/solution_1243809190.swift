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
    func isValidBST(_ root: TreeNode?) -> Bool {
        return dfs(root, Int.min, Int.max)
    }

    func dfs(_ root: TreeNode?, _ l: Int, _ r: Int) -> Bool {
        guard let root else {
            return true
        }
        if root.val > l && root.val < r {
            return dfs(root.left, l, root.val) && dfs(root.right, root.val, r)
        }
        return false
    }
}