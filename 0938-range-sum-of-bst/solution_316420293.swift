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
    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        guard let root = root else {
            return 0
        }
        var res = 0
        if root.val >= L && root.val <= R {
            res += root.val
        }
        res += rangeSumBST(root.left, L, R)
        res += rangeSumBST(root.right, L, R)
        return res
    }
}