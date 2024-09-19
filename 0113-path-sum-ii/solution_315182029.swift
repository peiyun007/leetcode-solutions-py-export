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
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var res = [[Int]]()
        var tmp = [Int]()
        dfs(root, sum, &res, &tmp)
        return res
    }
    func dfs(_ root: TreeNode?, _ sum: Int, _ res: inout [[Int]], _ tmp: inout [Int]) {
        guard let root = root else {
            return
        }
        tmp.append(root.val)
        if sum == root.val && root.left == nil && root.right == nil {
            res.append(tmp)
            return
        }
        var pathLeft = tmp
        var pathRight = tmp
        dfs(root.left, sum-root.val, &res, &pathLeft)
        dfs(root.right, sum-root.val, &res, &pathRight)
    }
}