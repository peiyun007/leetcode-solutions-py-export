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
    func rob(_ root: TreeNode?) -> Int {
        guard let root else { return  0 }
        var f = [TreeNode?: Int]()
        var g = [TreeNode?: Int]()
        dfs(root)
        return max(f[root] ?? 0, g[root] ?? 0)

        func dfs(_ root: TreeNode?) {
            guard let root else { return }
            dfs(root.left)
            dfs(root.right)
            f[root] = root.val + g[root.left, default: 0] + g[root.right, default: 0]
            g[root] = max(f[root.left] ?? 0, g[root.left, default: 0]) + max(f[root.right] ?? 0, g[root.right] ?? 0)
        }
    }
}

extension TreeNode: Hashable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs === rhs
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.val)
    }
}