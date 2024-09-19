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
    func flipMatchVoyage(_ root: TreeNode?, _ voyage: [Int]) -> [Int] {
        var flipped = [Int]()
        var index = 0
        dfs(root)
        if !flipped.isEmpty && flipped[0] == -1 {
            flipped.removeAll()
            flipped.append(-1)
            return flipped
        }
        return flipped

        func dfs(_ root: TreeNode?) {
            guard let root else { return }
            if root.val != voyage[index] {
                flipped.removeAll()
                flipped.append(-1)
                return
            }
            index += 1
            if let left = root.left, left.val != voyage[index] {
                flipped.append(root.val)
                dfs(root.right)
                dfs(root.left)
            } else {
                dfs(root.left)
                dfs(root.right)
            }
        }
    }
}