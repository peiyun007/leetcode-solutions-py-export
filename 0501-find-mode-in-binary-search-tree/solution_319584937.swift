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
    func findMode(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var stack = [TreeNode]()
        var fmap = [Int: Int]()
        stack.append(root)
        while !stack.isEmpty {
            var top = stack.last!
            stack.removeLast()
            
            if let freq = fmap[top.val] {
                fmap[top.val] = freq + 1
            } else {
                fmap[top.val] = 1
            }
            if let left = top.left {
                stack.append(left)
            }
            if let right = top.right {
                stack.append(right)
            }
        }
        var max = 0
        var res = [Int]()
        for (key, value) in fmap {
            if value > max {
                res.removeAll()
                max = value
                res.append(key)
            } else if value == max {
                res.append(key)
            }
        }
        return res
    }
}