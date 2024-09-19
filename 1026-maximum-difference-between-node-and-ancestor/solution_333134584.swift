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
    var maxDiff = 0
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        dfs(root)
        return maxDiff
    }
    
    func dfs(_ root: TreeNode) -> (Int, Int) {
        var ans = (root.val, root.val)
        if let leftChild = root.left {
            let left = dfs(leftChild)
            ans.0 = min(ans.0, left.0)
            ans.1 = max(ans.1, left.1)
            maxDiff = max(maxDiff, abs(root.val - left.0))
            maxDiff = max(maxDiff, abs(root.val - left.1))
        }
        if let rightChild = root.right {
            let right = dfs(rightChild)
            ans.0 = min(ans.0, right.0)
            ans.1 = max(ans.1, right.1)
            maxDiff = max(maxDiff, abs(root.val - right.0))
            maxDiff = max(maxDiff, abs(root.val - right.1))
        }
        return ans
    }
}