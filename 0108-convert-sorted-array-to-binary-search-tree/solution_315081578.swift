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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return sortedArrayToBST(nums, 0, nums.count - 1)
    }
    
    func sortedArrayToBST(_ nums: [Int], _ leftIdx: Int, _ rightIdx: Int) -> TreeNode? {
        if leftIdx > rightIdx {
            return nil
        }
        let middle = leftIdx + (rightIdx - leftIdx) / 2
        
        let node = TreeNode()
        node.val = nums[middle]
        node.left = sortedArrayToBST(nums, leftIdx, middle-1)
        node.right = sortedArrayToBST(nums, middle+1, rightIdx)
        return node
    }
}