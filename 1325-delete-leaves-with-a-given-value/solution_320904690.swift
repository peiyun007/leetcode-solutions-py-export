/* Definition for a binary tree node.
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
    func removeLeafNodes(_ root: TreeNode?, _ target: Int) -> TreeNode? {
        if dfs(root, target) {
            return nil
        }
        return root
    }
    
    func dfs(_ root: TreeNode?, _ target: Int) -> Bool {
        guard let root = root else {
            return true
        }
        if dfs(root.left, target) {
            root.left = nil
        }
        if dfs(root.right, target) {
            root.right = nil
        }
        if root.left == nil && root.right == nil && root.val == target {
            return true
        }
        return false
    }
}