/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
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
    func isSubPath(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        guard let root else { return false }
        return dfs(head, root) || isSubPath(head, root.left) || isSubPath(head, root.right)
        
        func dfs(_ head: ListNode?, _ root: TreeNode?) -> Bool {
            guard let head else { return true }
            guard let root else { return false }
            if head.val != root.val { return false }
            return dfs(head.next, root.left) || dfs(head.next, root.right)
        }
    }
}