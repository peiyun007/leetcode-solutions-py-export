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
    func countNodes(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        var level = 0
        var node = root
        while node?.left != nil {
            level += 1
            node = node?.left
        }
        var low = 1 << level
        var high = 1 << (level + 1)
        while low < high {
            let mid = low + (high - low) / 2
            if exists(root, level, mid) {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return low - 1
    }

    func exists(_ root: TreeNode?, _ level: Int, _ k: Int) -> Bool {
        var bits = 1 << (level - 1)
        var node = root
        while node != nil && bits > 0 {
            if bits & k == 0 {
                node = node?.left
            } else {
                node = node?.right
            }
            bits = bits >> 1
        }
        return node != nil
    }
}