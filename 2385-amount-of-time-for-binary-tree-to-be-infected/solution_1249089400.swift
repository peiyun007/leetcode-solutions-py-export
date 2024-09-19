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
    func amountOfTime(_ root: TreeNode?, _ start: Int) -> Int {
        var parent = [TreeNode: TreeNode]()
        var startNode: TreeNode?
        dfs(root)
        return maxDepth(startNode, startNode)
        
        func dfs(_ root: TreeNode?) {
            guard let root else { return }
            if root.val == start {
                startNode = root
            }
            if let left = root.left {
                parent[left] = root
                dfs(left)
            }
            if let right = root.right {
                parent[right] = root
                dfs(right)
            }
        }

        func maxDepth(_ node: TreeNode?, _ from: TreeNode?) -> Int {
            guard let node else { return -1 }
            var res = -1
            if let left = node.left, left !== from {
                res = max(res, maxDepth(left, node))
            }
            if let right = node.right, right !== from {
                res = max(res, maxDepth(right, node))
            }
            if let pa = parent[node], pa !== from {
                res = max(res, maxDepth(pa, node))
            }
            return res + 1
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