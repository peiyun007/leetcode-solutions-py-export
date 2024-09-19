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
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var res = 0
        helper(root.left, true, &res)
        helper(root.right, false, &res)
        return res
    }
    func helper(_ root: TreeNode?, _ isLeft: Bool, _ res: inout Int) -> Void {
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