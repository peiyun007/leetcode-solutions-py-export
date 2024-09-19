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
    var m = [Int: Int]()
    var maxFrequency = Int.min
    func findFrequentTreeSum(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        dfs(root)
        var res = [Int]()
        for (sum, num) in m {
            if num == maxFrequency {
                res.append(sum)
            }
        }
        return res
    }
    
    private func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var sum = root.val
        if let left = root.left {
            sum += dfs(root.left)
        }
        if let right = root.right {
            sum += dfs(root.right)
        }
        m[sum] = (m[sum] ?? 0) + 1
        if let msum = m[sum], msum > maxFrequency {
            maxFrequency = msum
        }
        return sum
    }
}