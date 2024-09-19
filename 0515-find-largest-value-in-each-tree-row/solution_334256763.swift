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
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var res = [Int]()
        var queue = [TreeNode]()
        queue.append(root)
        
        while !queue.isEmpty {
            let len = queue.count
            var maxNum = queue[0].val
            for i in 0..<len {
                let top = queue[0]
                if top.val > maxNum {
                    maxNum = top.val
                }
                queue.removeFirst()
                if let left = top.left {
                    queue.append(left)
                }
                if let right = top.right {
                    queue.append(right)
                }
            }
            res.append(maxNum)
        }
        return res
    }
}