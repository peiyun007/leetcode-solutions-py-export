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
    var sum = 0
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        dfs(root)
        return root
    }
    func dfs(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        dfs(root.right)
        sum += root.val
        root.val = sum
        dfs(root.left)
    }
}