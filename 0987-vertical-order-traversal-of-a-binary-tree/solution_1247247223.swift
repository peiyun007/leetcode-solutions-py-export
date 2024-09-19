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
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        var arr = [(Int, Int, Int)]()
        preOrder(root, 0, 0)
        arr.sort { 
            if $0.0 == $1.0 {
                if $0.1 == $1.1 {
                    return $0.2 < $1.2
                } else {
                    return $0.1 < $1.1
                }
            } else {
                return $0.0 < $1.0
            }
        }
        var lastCol = Int.min
        for (col, row, val) in arr {
            if col != lastCol {
                res.append([Int]())
            }
            res[res.count-1].append(val)
            lastCol = col
        }
        return res

        func preOrder(_ root: TreeNode?, _ row: Int, _ col: Int) {
            guard let root else { return }
            arr.append((col, row, root.val))
            preOrder(root.left, row+1, col-1)
            preOrder(root.right, row+1, col+1)
        }
    }
}