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
    func constructFromPrePost(_ pre: [Int], _ post: [Int]) -> TreeNode? {
        let len = pre.count
        if len == 0 {
            return nil
        }
        var root = TreeNode(pre[0])
        if len == 1 {
            return root
        }
        var l = 0
        for i in 0..<post.count {
            if post[i] == pre[1] {
                l = i + 1
            }
        }
        root.left = constructFromPrePost(Array(pre[1..<l+1]), Array(post[0..<l]))
        root.right = constructFromPrePost(Array(pre[l+1..<len]), Array(post[l..<len-1]))
        return root
    }
}