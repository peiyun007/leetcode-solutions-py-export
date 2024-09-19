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
    func btreeGameWinningMove(_ root: TreeNode?, _ n: Int, _ x: Int) -> Bool {
        var xNode: TreeNode?
        getSubtreeSize(root)
        let destVal = (n + 1) / 2
        let leftSize = getSubtreeSize(xNode?.left)
        if leftSize >= destVal {
            return true
        }
        let rightSize = getSubtreeSize(xNode?.right)
        if rightSize >= destVal {
            return true
        }
        let remainSize = n - 1 - leftSize - rightSize
        return remainSize >= destVal

        func getSubtreeSize(_ root: TreeNode?) -> Int {
            guard let root else { return 0 }
            if root.val == x {
                xNode = root
                return -1
            }
            return 1 + getSubtreeSize(root.left) + getSubtreeSize(root.right)
        }
    }
}