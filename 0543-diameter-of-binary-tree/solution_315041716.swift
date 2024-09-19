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
    var diameter = 1
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        maxDepth(root)
        return diameter - 1
    }
    fileprivate func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        let leftLen = maxDepth(root.left)
        let rightLen = maxDepth(root.right)
        diameter = max(diameter, leftLen + rightLen + 1)
        return max(leftLen, rightLen) + 1
    }
}