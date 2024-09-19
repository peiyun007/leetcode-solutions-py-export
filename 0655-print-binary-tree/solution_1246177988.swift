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
    func printTree(_ root: TreeNode?) -> [[String]] {
        var height = calHeight(root)
        let m = height + 1
        let n = getInt(pow(2, m)) - 1
        var res = Array(repeating: Array(repeating: "", count: n), count: m)
        dfs(root, 0, (n - 1) / 2)
        return res
        
        func dfs(_ root: TreeNode?, _ r: Int, _ c: Int) {
            guard let root else { return }
            res[r][c] = String(root.val)
            if root.left != nil {
                dfs(root.left, r+1, c-getInt(pow(2, height-r-1)))
            }
            if root.right != nil {
                dfs(root.right, r+1, c+getInt(pow(2, height-r-1)))
            }
        }
        
        func calHeight(_ root: TreeNode?) -> Int {
            guard let root else { return 0 }
            let l = root.left != nil ? calHeight(root.left) + 1 : 0
            let r = root.right != nil ? calHeight(root.right) + 1 : 0
            return max(l, r)
        }
    }

    func getInt(_ decimalNumber: Decimal) -> Int {
        let intValue = NSDecimalNumber(decimal: decimalNumber).intValue
        return intValue
    }
}