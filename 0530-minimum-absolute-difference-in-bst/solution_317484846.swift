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
    var min: Int = 100000
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        dfs(root)
        return min
    }
    
    func dfs(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        dfs(root.left)
        if let pre = pre {
            if abs(root.val - pre) < min {
                min = abs(root.val - pre)
            }
        } 
        // else {
        //    min = root.val 
        // }
        pre = root.val
        dfs(root.right)
    }
}