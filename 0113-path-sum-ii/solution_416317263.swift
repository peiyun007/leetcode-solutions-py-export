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
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var res = [[Int]]()
        var temp = [Int]()
        dfs(root, sum, &res, &temp)
        return res
    }
    
    private func dfs(_ root: TreeNode?, _ sum: Int, _ res: inout [[Int]], _ temp: inout [Int]) {
        guard let root = root else {
            return
        }
        if root.left == nil && root.right == nil && root.val == sum {
            temp.append(root.val)
            res.append(temp)
            temp.removeLast()
            return
        }
        temp.append(root.val)
        dfs(root.left, sum-root.val, &res, &temp)
        dfs(root.right, sum-root.val, &res, &temp)
        temp.removeLast()
    }
}