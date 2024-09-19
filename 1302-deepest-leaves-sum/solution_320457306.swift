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
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var queue = [TreeNode]()
        var sum = 0
        queue.append(root)
        while !queue.isEmpty {
            sum = 0
            for i in 0..<queue.count {
                var top = queue[0]
                queue.removeFirst() 
                sum += top.val
                
                if let left = top.left {
                    queue.append(left)
                }
                if let right = top.right {
                    queue.append(right)
                }
            }
        }
        return sum
    }
}