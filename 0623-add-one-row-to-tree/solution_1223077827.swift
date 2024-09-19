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
    func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
        if depth == 1 {
            return TreeNode(val, root, nil)
        }
        var cur = [root]
        for i in 1..<depth-1 {
            var temp = [TreeNode?]()
            for node in cur {
                if let left = node?.left {
                    temp.append(left)
                }
                if let right = node?.right {
                    temp.append(right)
                }
            }
            cur = temp
        }
        for node in cur {
            node?.left = TreeNode(val, node?.left, nil)
            node?.right = TreeNode(val, nil, node?.right)
        }
        return root
    }
}