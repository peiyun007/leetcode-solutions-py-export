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
    var first: TreeNode?
    var middle: TreeNode?
    var last: TreeNode?
    var pre: TreeNode?
    func recoverTree(_ root: TreeNode?) {
        inOrder(root)
        if let first, let last {
            (first.val, last.val) = (last.val, first.val)
        } else if let first, let middle {
            (first.val, middle.val) = (middle.val, first.val)
        }
    }

    func inOrder(_ root: TreeNode?) {
        guard let root else { return }
        inOrder(root.left)
        if let pre, root.val < pre.val {
            if first == nil {
                first = pre
                middle = root
            } else {
                last = root
            }
        }
        pre = root
        inOrder(root.right)
    }
}