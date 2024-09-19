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
    // 0: 无覆盖  1:有摄像头  2. 有覆盖
    func minCameraCover(_ root: TreeNode?) -> Int {
        var res = 0
        if dfs(root) == 0 {
            res += 1
        }
        return res

        func dfs(_ root: TreeNode?) -> Int {
            guard let root else { return 2 }
            let left = dfs(root.left)
            let right = dfs(root.right)
            if left == 2 && right == 2 {
                return 0
            }
            if left == 0 || right == 0 {
                res += 1
                return 1
            }
            if left == 1 || right == 1 {
                return 2
            }
            return -1
        }
    }
}