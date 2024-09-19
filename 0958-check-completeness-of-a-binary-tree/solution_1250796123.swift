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
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        guard let root else { return false }
        var arr = [(TreeNode, Int)]()
        arr.append((root, 1))
        var i = 0
        while !arr.isEmpty {
            let pair = arr.removeFirst()
            i += 1
            let cur = pair.0
            let idx = pair.1
            if i != idx {
                return false
            }
            if let left = cur.left {
                arr.append((left, 2 * idx))
            }
            if let right = cur.right {
                arr.append((right, 2 * idx + 1))
            }
        }
        return true
    }
}