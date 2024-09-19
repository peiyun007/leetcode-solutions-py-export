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
    var h_max = 0
    var maxLevel = -1
    var destVal = 0
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        h_max = height(root)
        helper(root, 0)
        return destVal
    }
    
    func helper(_ root: TreeNode?, _ level: Int) {
        guard let root = root else {
            return
        }
        if level > maxLevel {
            if level + 1 == h_max {
                destVal = root.val
            }
            maxLevel = level
        }
        helper(root.left, level + 1)
        helper(root.right, level + 1)
    }
    
    private func height(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        return max(height(root.left), height(root.right)) + 1
    }
}