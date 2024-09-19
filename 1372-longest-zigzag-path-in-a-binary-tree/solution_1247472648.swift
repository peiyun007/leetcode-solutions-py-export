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
    func longestZigZag(_ root: TreeNode?) -> Int {
        var maxLen = 0
        dfs(root, false, 0)
        dfs(root, true, 0)
        return maxLen

        func dfs(_ root: TreeNode?, _ isLeft: Bool, _ len: Int) {
            guard let root else { return }
            maxLen = max(maxLen, len)
            if isLeft {
                if let left = root.left {
                    dfs(left, !isLeft, len+1)
                }
                if let right = root.right {
                    dfs(right, isLeft, 1)
                }
            } else {
                if let right = root.right {
                    dfs(right, !isLeft, len+1)
                }
                if let left = root.left {
                    dfs(left, isLeft, 1)
                }
            }
        }
    }
}