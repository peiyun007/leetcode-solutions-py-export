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
    func sumEvenGrandparent(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var p: TreeNode? = nil
        var gp: TreeNode? = nil
        var sum = 0
        dfs(root, p, gp, &sum)
        return sum
    }
    func dfs(_ root: TreeNode?, _ p: TreeNode?, _ gp: TreeNode?, _ sum: inout Int) {
        guard let root = root else {
            return
        }
        var v_p = root
        var v_gp = p
        if let gpValue = gp?.val, gpValue % 2 == 0 {
            sum += root.val
        }
        dfs(root.left, v_p, v_gp, &sum)
        dfs(root.right, v_p, v_gp, &sum)
    }
}