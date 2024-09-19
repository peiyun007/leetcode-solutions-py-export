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
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else {
            return 0
        }
        let res = totalPath(root, sum)
        let left = pathSum(root.left, sum)
        let right = pathSum(root.right, sum)
        return res + left + right
    }
    func totalPath(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else {
            return 0
        }
        var res = 0
        if sum == root.val {
            res += 1
        }
        res += totalPath(root.left, sum-root.val) 
        res += totalPath(root.right, sum-root.val)
        return res
    }
}