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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        let n = preorder.count
        var map = [Int: Int]()
        for i in 0..<n {
            map[inorder[i]] = i
        }
        return dfs(0, n-1, 0, n-1)

        func dfs(_ preorder_left: Int, _ preorder_right: Int, _ inorder_left: Int, _ inorder_right: Int) -> TreeNode? {
            if preorder_left > preorder_right {
                return nil
            }
            let preorder_root = preorder_left
            let inorder_root = map[preorder[preorder_root], default: 0]
            let root = TreeNode(preorder[preorder_root])
            let size = inorder_root - inorder_left
            root.left = dfs(preorder_left+1, preorder_left+size, inorder_left, inorder_root-1)
            root.right = dfs(preorder_left+size+1, preorder_right, inorder_root+1, inorder_right)
            return root
        }
    }
}