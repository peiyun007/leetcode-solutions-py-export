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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var res = [[Int]]()
        var stack = [TreeNode]()
        stack.append(root)
        while !stack.isEmpty {
            var tmp = [Int]()
            let levelSize = stack.count
            for i in 0..<levelSize {
                let top = stack[0]
                tmp.append(top.val)
                stack.removeFirst()
                
                if let left = top.left {
                    stack.append(left)
                }
                if let right = top.right {
                    stack.append(right)
                }
            }
            res.append(tmp)
        }
        return res
    }
}