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
    func maxLevelSum(_ root: TreeNode?) -> Int {
        var sum = [Int]()
        dfs(root, 0)
        var maxVal = Int.min
        var res = -1
        for (idx, x) in sum.enumerated() {
            if x > maxVal {
                maxVal = x
                res = idx + 1
            }
        }
        return res

        func dfs(_ root: TreeNode?, _ level: Int) {
            guard let root else { return }
            if level == sum.count {
                sum.append(root.val)
            } else {
                sum[level] += root.val
            }
            if let left = root.left {
                dfs(left, level+1)
            }
            if let right = root.right {
                dfs(right, level+1)
            }
        }
    }
}