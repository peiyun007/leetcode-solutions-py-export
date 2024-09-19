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
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        let n = inorder.count
        var map = [Int: Int]()
        for i in 0..<n {
            map[inorder[i]] = i
        }
        return dfs(0, n-1, 0, n-1)

        func dfs(_ postorder_left: Int, _ postorder_right: Int, _ inorder_left: Int, _ inorder_right: Int) -> TreeNode? {
            if postorder_left > postorder_right {
                return nil
            }
            let postorder_root = postorder_right
            let inorder_root = map[postorder[postorder_root], default: 0]
            let root = TreeNode(postorder[postorder_root])
            let size = inorder_root - inorder_left
            root.left = dfs(postorder_left, postorder_left+size-1, inorder_left, inorder_root-1)
            root.right = dfs(postorder_left+size, postorder_right-1, inorder_root+1, inorder_right)
            return root
        }
    }
}