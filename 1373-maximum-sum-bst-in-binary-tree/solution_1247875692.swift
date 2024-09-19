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
    typealias SubTree = (isBST: Bool, minValue: Int, maxValue: Int, sumValue: Int)

    func maxSumBST(_ root: TreeNode?) -> Int {
        var res = 0
        dfs(root)
        return res

        func dfs(_ root: TreeNode?) -> SubTree {
            guard let root else { return (true, Int.max, Int.min, 0) }
            let left = dfs(root.left)
            let right = dfs(root.right)
            if left.isBST && right.isBST && root.val > left.maxValue && root.val < right.minValue {
                let sum = left.sumValue + right.sumValue + root.val
                res = max(res, sum)
                return (true, min(left.minValue, root.val), max(right.maxValue, root.val), sum)
            } else {
                return (false, 0, 0, 0)
            }
        }
    }
}