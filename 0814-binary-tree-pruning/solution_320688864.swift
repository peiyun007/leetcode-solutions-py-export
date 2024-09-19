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
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        return containsOne(root) ? root : nil
    }
    
    func containsOne(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return false
        }
        let leftFlag = containsOne(root.left)
        let rightFlag = containsOne(root.right)
        if !leftFlag {
            root.left = nil
        }
        if !rightFlag {
            root.right = nil
        }
        return root.val == 1 || leftFlag || rightFlag
    }
}