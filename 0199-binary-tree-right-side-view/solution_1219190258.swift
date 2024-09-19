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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root else {
            return []
        }
        var queue = [TreeNode]()
        queue.append(root)
        var ans = [Int]()

        while !queue.isEmpty {
            var size = queue.count
            while size > 0 {
                let cur = queue.removeFirst()
                if size == 1 {
                    ans.append(cur.val)
                }
                if let left = cur.left {
                    queue.append(left)
                }
                if let right = cur.right {
                    queue.append(right)
                }

                size -= 1
            }
        }
        return ans
    }
}