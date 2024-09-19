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
    func sumNumbers(_ root: TreeNode?) -> Int {
        var sum = 0
        dfs(root, 0)
        return sum

        func dfs(_ root: TreeNode?, _ x: Int) {
            guard let root else { return }
            let ans = root.val + 10 * x
            if root.left == nil, root.right == nil {
                sum += ans
            }
            dfs(root.left, ans)
            dfs(root.right, ans)
        }
    }
}