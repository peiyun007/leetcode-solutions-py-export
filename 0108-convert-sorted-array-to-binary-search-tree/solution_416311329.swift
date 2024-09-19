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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return sortedArrayToBST(nums, 0, nums.count-1)
    }
    
    func sortedArrayToBST(_ nums: [Int], _ lo: Int, _ hi: Int) -> TreeNode? {
        if lo > hi {
            return nil
        }
        let mid = (lo + hi) / 2
        var node = TreeNode(nums[mid])
        node.left = sortedArrayToBST(nums, lo, mid - 1)
        node.right = sortedArrayToBST(nums, mid + 1, hi)
        return node
    } 
}