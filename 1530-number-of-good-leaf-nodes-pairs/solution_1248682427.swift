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
    func countPairs(_ root: TreeNode?, _ distance: Int) -> Int {
        return dfs(root).1

        func dfs(_ root: TreeNode?) -> ([Int], Int) {
            var f = Array(repeating: 0, count: distance + 1)
            guard let root else { return (f, 0) }
            if root.left == nil && root.right == nil {
                f[0] = 1
                return (f, 0)
            }
            let (fl, pl) = dfs(root.left)
            let (fr, pr) = dfs(root.right)
            var pairs = 0
            for (dl, cl) in fl.enumerated() {
                for (dr, cr) in fr.enumerated() {
                    if dl + dr + 2 <= distance {
                        pairs += cl * cr
                    }
                }
            }
            for i in 0..<distance {
                f[i+1] = fl[i] + fr[i]
            }
            return (f, pairs + pl + pr)
        }
    }
}