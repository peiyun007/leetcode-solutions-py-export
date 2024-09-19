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
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        return construct(nums, 0, nums.count)
    }
    
    func construct(_ nums: [Int], _ l: Int, _ r: Int) -> TreeNode? {
        guard r > l else {
            return nil
        }
        let maxIndex = getMaxElementIndex(nums, l, r)
        let node = TreeNode(nums[maxIndex])
        node.left = construct(nums, l, maxIndex)
        node.right = construct(nums, maxIndex + 1, r)
        return node
    }
    
    func getMaxElementIndex(_ nums: [Int], _ l: Int, _ r: Int) -> Int {
        var maxIndex = l
        for i in l..<r {
            if nums[i] > nums[maxIndex] {
                maxIndex = i
            }
        }
        return maxIndex
    }
}