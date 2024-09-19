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
    var list: [Int] = []
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        inOrder(root1)
        inOrder(root2)
        return list.sorted{$0<$1}
    }
    
    func inOrder(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        inOrder(root.left)
        list.append(root.val)
        inOrder(root.right)
    }
}