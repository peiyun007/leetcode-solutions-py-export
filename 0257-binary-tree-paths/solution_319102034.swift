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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var temp = ""
        var res = [String]()
        dfs(root, &temp, &res)
        return res
    }
    func dfs(_ root: TreeNode?, _ temp: inout String, _ res: inout [String]) {
        guard let root = root else {
            return
        }
        var tempLocal = temp
        tempLocal += String(root.val)
        if root.left == nil && root.right == nil {
            res.append(tempLocal)
            return
        } else {
            tempLocal += "->"
        }
        dfs(root.left, &tempLocal, &res)
        dfs(root.right, &tempLocal, &res)
    }
}