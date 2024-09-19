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
    func flatten(_ root: TreeNode?) {
        guard let root else { return }
        var values = [Int]()
        preOrder(root)
        var pre = root
        for i in 1..<values.count {
            let x = values[i]
            let node = TreeNode(x, nil, nil)
            pre.left = nil
            pre.right = node
            pre = node
        }

        func preOrder(_ root: TreeNode?) {
            guard let root else { return }
            values.append(root.val)
            preOrder(root.left)
            preOrder(root.right)
        }
    }

    
}