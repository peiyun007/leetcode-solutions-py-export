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
    var tilt = 0
    func findTilt(_ root: TreeNode?) -> Int {
        dfs(root)
        return tilt
    }
    func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        let left = dfs(root.left)
        let right = dfs(root.right)
        tilt += abs(left - right)
        return root.val + left + right
    }
}