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
    func reverseOddLevels(_ root: TreeNode?) -> TreeNode? {
        dfs(root?.left, root?.right, true)
        return root
        
        func dfs(_ root1: TreeNode?, _ root2: TreeNode?, _ isOdd: Bool) {
            guard let root1, let root2 else { return }
            if isOdd {
                (root1.val, root2.val) = (root2.val, root1.val)
            }
            dfs(root1.left, root2.right, !isOdd)
            dfs(root1.right, root2.left, !isOdd)
        }
    }
}