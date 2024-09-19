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
    var cur: TreeNode?
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        let ans = TreeNode(0)
        cur = ans
        inorder(root)
        return ans.right
    }
    
    func inorder(_ node: TreeNode?) {
        guard let node = node else {
            return
        }
        inorder(node.left)
        node.left = nil
        cur?.right = node
        cur = node
        inorder(node.right)
    }
}