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
    func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
        guard let root = root else {
            return []
        }
        var list = [TreeNode?]()
        let set = Set<Int>(to_delete)
        if !set.contains(root.val) {
            list.append(root)
        }
        del(root, set, &list)
        return list
    }
    
    private func del(_ root: TreeNode?, _ to_delete: Set<Int>, _ list: inout [TreeNode?]) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        root.left = del(root.left, to_delete, &list)
        root.right = del(root.right, to_delete, &list)
        if to_delete.contains(root.val) {
            if let left = root.left {
                list.append(left)
            }
            if let right = root.right {
                list.append(right)
            }
            return nil
        }
        return root
    }
}