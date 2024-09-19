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
    func replaceValueInTree(_ root: TreeNode?) -> TreeNode? {
        guard let root else { return nil }
        var q = [TreeNode]()
        q.append(root)
        root.val = 0

        while !q.isEmpty {
            var q2 = [TreeNode]()
            var sum = 0
            for fa in q {
                if let left = fa.left {
                    q2.append(left)
                    sum += left.val
                }
                if let right = fa.right {
                    q2.append(right)
                    sum += right.val
                }
            }
            for fa in q {
                let childSum = (fa.left?.val ?? 0) + (fa.right?.val ?? 0)
                fa.left?.val = sum - childSum
                fa.right?.val = sum - childSum
            }
            q = q2
        }
        return root
    }
}
