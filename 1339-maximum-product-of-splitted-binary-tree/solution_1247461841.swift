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
    func maxProduct(_ root: TreeNode?) -> Int {
        var sum = 0, best = -1
        let mod = 1_0000_0000_7
        dfs(root)
        dfs2(root)
        return (best * (sum - best)) % mod

        func dfs(_ root: TreeNode?) {
            guard let root else { return }
            sum += root.val
            dfs(root.left)
            dfs(root.right)
        }

        func dfs2(_ root: TreeNode?) -> Int {
            guard let root else { return  0 }
            let cur = dfs2(root.left) + dfs2(root.right) + root.val
            if best == -1 || abs(cur * 2 - sum) < abs(best * 2 - sum) {
                best = cur
            }
            return cur
        }
    }
}