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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        var queue = [TreeNode]()
        if let root {
            queue.append(root)
        }
        var flag = true
        while !queue.isEmpty {
            var temp = [Int]()
            var size = queue.count
            while size > 0 {
                let cur = queue.removeFirst()
                if flag {
                    temp.append(cur.val)
                } else {
                    temp.insert(cur.val, at: 0)
                }
                if let left = cur.left {
                    queue.append(left)
                }
                if let right = cur.right {
                    queue.append(right)
                }
                size -= 1
            }
            res.append(temp)
            flag.toggle()
        }
        return res
    }
}