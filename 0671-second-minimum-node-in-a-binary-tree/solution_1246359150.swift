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
    func findSecondMinimumValue(_ root: TreeNode?) -> Int {
        let rootVal = root?.val ?? 0
        var ans = -1
        dfs(root)
        return ans

        func dfs(_ root: TreeNode?) {
            guard let root else { return }
            if ans != -1 && root.val >= ans {
                return
            }
            if root.val > rootVal {
                ans = root.val
            }
            dfs(root.left)
            dfs(root.right)
        }
    }
}