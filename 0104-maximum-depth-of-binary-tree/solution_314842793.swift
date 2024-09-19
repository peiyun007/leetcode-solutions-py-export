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
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var stack = [TreeNode]()
        var maxDepth = 0
        stack.append(root)
        
        while !stack.isEmpty {
            maxDepth += 1
            let levelSize = stack.count
            
            for i in 0..<levelSize {
                let top = stack[0]
                stack.removeFirst()
                
                if let left = top.left {
                    stack.append(left)
                }
                if let right = top.right {
                    stack.append(right)
                }
            }
        }
        return maxDepth
    }
}