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
    func sufficientSubset(_ root: TreeNode?, _ limit: Int) -> TreeNode? {
        let flag = checkSufficientLeaf(root, 0)
        return flag ? root : nil;

        func checkSufficientLeaf(_ root: TreeNode?, _ sum: Int) -> Bool {
            guard let root else { return false }
            if root.left == nil && root.right == nil {
                return sum + root.val >= limit
            }
            let left = checkSufficientLeaf(root.left, sum+root.val)
            let right = checkSufficientLeaf(root.right, sum+root.val)
            if !left {
                root.left = nil
            }
            if !right {
                root.right = nil
            }
            return left || right
        }
    }
}