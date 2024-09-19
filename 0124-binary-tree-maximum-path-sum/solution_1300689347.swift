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
    func maxPathSum(_ root: TreeNode?) -> Int {
        var ans = Int.min
        dfs(root)
        return ans

        func dfs(_ root: TreeNode?) -> Int {
            guard let root else {
                return 0
            }
            let leftVal = dfs(root.left)
            let rightVal = dfs(root.right)
            let sum = max(leftVal, 0) + max(rightVal, 0) + root.val
            ans = max(ans, sum)

            return max(max(leftVal, 0), max(rightVal, 0)) + root.val
        }
    }
}