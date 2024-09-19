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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        guard let root = root else {
            return 0
        }
        var total = k
        var stack = [TreeNode]()
        var current: TreeNode? = root
        while !stack.isEmpty || current != nil {
            while let currentUnwrapped = current {
                stack.append(currentUnwrapped)
                current = currentUnwrapped.left
            }
            let top = stack.last!
            stack.removeLast()
            total -= 1
            if total == 0 {
                return top.val
            }
            current = top.right
        }
        return -1
    }
}