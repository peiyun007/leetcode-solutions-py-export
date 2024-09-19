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
    func balanceBST(_ root: TreeNode?) -> TreeNode? {
        var nums = [Int]()
        inOrder(root)
        return buildTree(0, nums.count-1)
        
        func inOrder(_ root: TreeNode?) {
            guard let root else { return }
            inOrder(root.left)
            nums.append(root.val)
            inOrder(root.right)
        }

        func buildTree(_ start: Int, _ end: Int) -> TreeNode? {
            if start > end { return nil }
            let mid = start + (end - start) / 2
            let root = TreeNode(nums[mid])
            root.left = buildTree(start, mid-1)
            root.right = buildTree(mid+1, end)
            return root
        }
    }
}