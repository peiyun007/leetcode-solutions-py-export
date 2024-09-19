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
    func goodNodes(_ root: TreeNode?) -> Int {
        var res = 0
        dfs(root, Int.min)
        return res

        func dfs(_ root: TreeNode?, _ pathMax: Int) {
            guard let root else { return }
            if root.val >= pathMax {
                res += 1
            }
            dfs(root.left, max(root.val, pathMax))
            dfs(root.right, max(root.val, pathMax))
        }
    }
}