/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
        var parents = [TreeNode: TreeNode]()
        findParent(root)
        var res = [Int]()
        findAns(target, nil, 0)
        return res
        
        func findParent(_ root: TreeNode?) {
            guard let root else { return }
            if let left = root.left {
                parents[left] = root
                findParent(left)
            }
            if let right = root.right {
                parents[right] = root
                findParent(right)
            }
        }

        func findAns(_ node: TreeNode?, _ from: TreeNode?, _ depth: Int) {
            guard let node else { return }
            if depth == k {
                res.append(node.val)
                return
            }
            if let left = node.left, left !== from {
                findAns(left, node, depth+1)
            }
            if let right = node.right, right != from {
                findAns(right, node, depth+1)
            }
            if let parent = parents[node], parent != from {
                findAns(parent, node, depth+1)
            }
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