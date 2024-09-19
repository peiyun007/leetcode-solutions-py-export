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
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        var px = -1, py = -1
        var dx = 0, dy = 0
        findParent(root, x, &px, 0, &dx)
        findParent(root, y, &py, 0, &dy)
        return px != py && dx == dy
    }
    
    func findParent(_ root: TreeNode?, _ child: Int, _ par: inout Int, _ depth: Int, _ depthChild: inout Int) -> Bool {
        guard let root = root else {
            return false
        }
        if root.val == child {
            depthChild = depth
            return true
        }
        let find = findParent(root.left, child, &par, depth + 1, &depthChild) || findParent(root.right, child, &par, depth + 1, &depthChild)
        if find {
            if par == -1 {
                par = root.val
            }
            return true
        } else {
            return false
        }
    }
}