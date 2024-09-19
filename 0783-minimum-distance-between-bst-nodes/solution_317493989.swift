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
    var pre: Int?
    var min = Int.max
    func minDiffInBST(_ root: TreeNode?) -> Int {
        dfs(root)
        return min
    }
    
    func dfs(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        dfs(root.left)
        if let pre = pre {
            if root.val - pre < min {
                min = root.val - pre
            } 
        }
        pre = root.val
        
        dfs(root.right)
    }
}