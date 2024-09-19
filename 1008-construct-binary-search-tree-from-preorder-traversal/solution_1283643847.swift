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
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        let n = preorder.count
        if n == 0 {
            return nil
        }
        return dfs(0, n-1)
        
        func dfs(_ left: Int, _ right: Int) -> TreeNode? {
            if left > right {
                return nil
            }
            let root = TreeNode(preorder[left])
            if left == right {
                return root
            }
            let target = preorder[left]
            var l = left, r = right + 1
            while l < r {
                let mid = l + (r-l) / 2
                if preorder[mid] < target {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            if l != left {
                root.left = dfs(left+1, l-1)
                root.right = dfs(l, right)
            } else {
                root.left = nil
                root.right = dfs(left+1, right)
            }
            return root
        }
    }
}