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
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var stack = [TreeNode]()
        stack.append(root)
        var minDepth = 0
        
        while !stack.isEmpty {
            minDepth += 1
            let levelSize = stack.count
            for i in 0..<levelSize {
                let top = stack[0]
                stack.removeFirst()
                
                if top.left == nil && top.right == nil {
                    return minDepth
                }
                if let left = top.left {
                    stack.append(left)
                }
                if let right = top.right {
                    stack.append(right)
                }
            }
            
        }
        return minDepth
    }
}