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
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        var res = 0
        helper(root, false, &res)
        return res
    }
    
    private func helper(_ root: TreeNode?,_ isLeft: Bool, _ res: inout Int) {
        guard let root = root else {
            return
        }
        if isLeft && root.left == nil && root.right == nil {
            res += root.val
            return
        }
        helper(root.left, true, &res)
        helper(root.right, false, &res)
    }
}