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
//     var value: Int = 0
//     func isUnivalTree(_ root: TreeNode?) -> Bool {
//         guard let root = root else {
//             return true
//         }
//         value = root.val
//         return helper(root)
//     }
    
//     func helper(_ root: TreeNode?) -> Bool {
//         guard let root = root else {
//             return true
//         }
//         if root.val != value {
//             return false
//         }
//         return helper(root.left) && helper(root.right)
//     }
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        let leftRes = (root.left == nil || (root.val == root.left!.val && isUnivalTree(root.left)))
        let rightRes = (root.right == nil || (root.val == root.right!.val && isUnivalTree(root.right)))
        return leftRes && rightRes
    }
}