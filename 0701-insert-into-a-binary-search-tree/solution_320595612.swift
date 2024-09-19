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
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else {
            return TreeNode(val)
        }
        var node: TreeNode? = root
        while node != nil {
            guard let nodeUnwrapped = node else {
                break
            }
            if nodeUnwrapped.val >= val {
                if let left = nodeUnwrapped.left {
                    node = left
                } else {
                    nodeUnwrapped.left = TreeNode(val)
                    break
                }
            } else if nodeUnwrapped.val < val {
                if let right = nodeUnwrapped.right {
                    node = right
                } else {
                    nodeUnwrapped.right = TreeNode(val)
                    break
                }
            }
        }
        return root
    }
}