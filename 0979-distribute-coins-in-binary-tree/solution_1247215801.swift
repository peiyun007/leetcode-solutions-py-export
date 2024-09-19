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
    func distributeCoins(_ root: TreeNode?) -> Int {
        var moves = 0
        dfs(root)
        return moves

        func dfs(_ root: TreeNode?) -> Int {
            guard let root else { return 0 }
            var moveLeft = 0, moveRight = 0
            if let left = root.left {
                moveLeft = dfs(left)
            }
            if let right = root.right {
                moveRight = dfs(right)
            }
            moves += abs(moveLeft)
            moves += abs(moveRight)
            return moveLeft + moveRight + root.val - 1 
        }
    }
}