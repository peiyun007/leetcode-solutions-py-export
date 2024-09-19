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
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        return traverse(s, t)
    }
    
    func isEqual(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil && t == nil {
            return true
        }
        guard let s = s, let t = t else {
            return false
        }
        return s.val == t.val && isEqual(s.left, t.left) && isEqual(s.right, t.right)
    }
    
    func traverse(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        guard let s = s, let t = t else {
            return false
        }
        return isEqual(s, t) || traverse(s.left, t) || traverse(s.right, t)
    }
}