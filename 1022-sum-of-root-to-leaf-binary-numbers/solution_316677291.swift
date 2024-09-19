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
    var result = 0
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        sumRootToLeaf(root, 0)
        return result
    }
    func sumRootToLeaf(_ root: TreeNode?, _ num: Int) -> Int {
        guard let root = root else {
            return 0
        }
        var sum = 2 * num
        sum += root.val
        if root.left == nil && root.right == nil {
            result += sum
        }
        sumRootToLeaf(root.left, sum)
        sumRootToLeaf(root.right, sum)
        return sum
    }
}