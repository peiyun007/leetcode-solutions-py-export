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
    var ans = 0
    func longestUnivaluePath(_ root: TreeNode?) -> Int {
        arrowLength(root)
        return ans
    }
    
    func arrowLength(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var left = arrowLength(root.left)
        var right = arrowLength(root.right)
        var arrowLeft = 0, arrowRight = 0
        if let leftValue = root.left?.val, root.val == leftValue {
            arrowLeft += (left + 1)
        }
        if let rightValue = root.right?.val, root.val == rightValue {
            arrowRight += (right + 1)
        }
        ans = max(ans, arrowLeft + arrowRight)
        return max(arrowLeft, arrowRight)
    }
}