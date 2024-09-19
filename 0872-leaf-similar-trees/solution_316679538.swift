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
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        var nums1 = [Int]()
        var nums2 = [Int]()
        dfs(root1, &nums1)
        dfs(root2, &nums2)
        return nums1 == nums2
    }
    func dfs(_ root: TreeNode?, _ nums: inout [Int]) {
        guard let root = root else {
            return
        }
        if root.left == nil && root.right == nil {
            nums.append(root.val)
            return
        }
        dfs(root.left, &nums)
        dfs(root.right, &nums)
    }
}