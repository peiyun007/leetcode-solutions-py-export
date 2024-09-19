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
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n == 0 {
            return []
        }
        return dfs(1, n)
    }

    func dfs(_ start: Int, _ end: Int) -> [TreeNode?] {
        if start > end {
            return [nil]
        }
        var allTrees = [TreeNode?]()
        for i in start...end {
            let left = dfs(start, i-1)
            let right = dfs(i+1, end)
            for l in left {
                for r in right {
                    let node = TreeNode(i)
                    node.left = l
                    node.right = r
                    allTrees.append(node)
                }
            }
        }
        return allTrees
    }
}