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
    func tree2str(_ t: TreeNode?) -> String {
        guard let t = t else {
            return ""
        }
        if t.left == nil && t.right == nil {
            return String(t.val) + ""
        }
        if t.right == nil {
            return String(t.val) + "(" + tree2str(t.left) + ")"
        }
        return String(t.val) + "(" + tree2str(t.left) + ")" + "(" + tree2str(t.right) + ")"
    }
}