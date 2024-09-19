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
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        var repeated = Set<TreeNode>()
        var seen = [String: TreeNode]()
        dfs(root)
        return Array(repeated)

        func dfs(_ root: TreeNode?) -> String {
            guard let root else { return "" }
            let str = String(root.val) + "(" + dfs(root.left) + ")" + "(" + dfs(root.right) + ")"
            if let node = seen[str] {
                repeated.insert(node)
            } else {
                seen[str] = root
            }
            return str
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