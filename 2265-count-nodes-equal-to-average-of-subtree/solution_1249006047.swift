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
    func averageOfSubtree(_ root: TreeNode?) -> Int {
        var totalCount = 0
        dfs(root)
        return totalCount

        func dfs(_ root: TreeNode?) -> (Int, Int) {
            guard let root else { return (0, 0) }
            var sum = root.val
            var cnt = 1
            if let left = root.left {
                let res_l = dfs(left)
                sum += res_l.0
                cnt += res_l.1
            }
            if let right = root.right {
                let res_r = dfs(right)
                sum += res_r.0
                cnt += res_r.1
            }
            if sum / cnt == root.val {
                totalCount += 1
            }
            return (sum, cnt)
        }
    }
}